# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=less3-bin
pkgver=4.1.3
pkgrel=1
pkgdesc="S3-compatible object storage server that runs anywhere"
arch=('x86_64' 'aarch64')
url="https://github.com/jchristn/Less3"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/less3-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/less3-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('aca1d5a5be59b62faab7a3c52db16dd1323093e4f9304e1701c9b699ad54dd42')
sha256sums_aarch64=('0d078f7c00480a39f2db7f73513d9a1ccb151086f76345e7db466530277c9fd9')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="less3-${pkgver}-linux-x64" ;;
    aarch64) _dir="less3-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/less3" "${pkgdir}/usr/bin/less3"
  install -Dm644 "${_dir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
