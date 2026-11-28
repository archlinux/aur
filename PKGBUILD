# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=grpcbin-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="httpbin-like test server for gRPC"
arch=('x86_64' 'aarch64')
url="https://github.com/moul/grpcbin"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/grpcbin_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/grpcbin_Linux_arm64.tar.gz")
sha256sums_x86_64=('f0bee2e90ff136863ab7ce28d2021cf9c6df9d81d6cd73492f6560ae7c6b70aa')
sha256sums_aarch64=('bb59e30804465768b7dcd07f972aedfbce5046f144a1502445c36eb2e147cf5e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="grpcbin_Linux_x86_64" ;;
    aarch64) _dir="grpcbin_Linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/grpcbin" "${pkgdir}/usr/bin/grpcbin"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
