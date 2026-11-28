# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jevlint-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Linter that codifies code taste using Jev"
arch=('x86_64' 'aarch64')
url="https://github.com/codegirl-007/jevlint"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jevlint_v${pkgver}_linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jevlint_v${pkgver}_linux-arm64.tar.gz")
sha256sums_x86_64=('b3cb0e4cfc9df1cb90d81cd45d7b87052c38a1b13a85a199a80a446bdb97a5ab')
sha256sums_aarch64=('c4fc49e5ae803407af378b0679f1e528e1f4899152ca6a5ef08c6b5025c071bd')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="jevlint_v${pkgver}_linux-amd64" ;;
    aarch64) _dir="jevlint_v${pkgver}_linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/jevlint" "${pkgdir}/usr/bin/jevlint"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
