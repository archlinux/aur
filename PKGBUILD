# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ladon-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Reactive anti-DPI engine"
arch=('x86_64' 'aarch64')
url="https://github.com/belotserkovtsev/Ladon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/belotserkovtsev/Ladon/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ladon-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ladon-linux-arm64.tar.gz")
sha256sums=('5686c9791c96023a109a1a5fb2f1e06c3bec04a8aae7f273f7c650447f1d0bb4')
sha256sums_x86_64=('d9b6cebba3de7fe7e2fd6461e927422a25c4af712f810a4a3d5cca58ed7fc72e')
sha256sums_aarch64=('c4ce0c5fb08e7b7247f6dcab396b18f58aae8aeead8039f7e18a2d6b6ab0962f')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ladon-linux-amd64-v${pkgver}" ;;
    aarch64) _dir="ladon-linux-arm64-v${pkgver}" ;;
  esac
  install -Dm755 "${_dir}/ladon" "${pkgdir}/usr/bin/ladon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
