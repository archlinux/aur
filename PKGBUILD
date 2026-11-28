# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wxdown-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Download WeChat articles as HTML or PDF"
arch=('x86_64' 'aarch64')
url="https://github.com/systemmin/wxdown"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/systemmin/wxdown/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wxdown_${pkgver}_Linux_x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wxdown_${pkgver}_Linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('a68e8bfcdc4d9fb92fde9e7299deca9f3d25523e5121c931120cf4f24ae89eff')
sha256sums_aarch64=('53a59409fb7316265c4a42f1626a88215b3ffacd8dbf8aa1524c9d0d9b98e910')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="wxdown_${pkgver}_Linux_x64" ;;
    aarch64) _dir="wxdown_${pkgver}_Linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/wxdown" "${pkgdir}/usr/bin/wxdown"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
