# Maintainer: Sentria <admin@sentrialabs.com>
pkgname=maryanne-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='Read ebook (EPUB) or PDF aloud to you with natural-sounding voices.'
arch=('x86_64')
url='https://maryanne.app'
license=('custom')
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'libsecret')
release_repo='finnvyrn/maryanne-releases'
source=(
  "maryanne-${pkgver}.AppImage::https://github.com/${release_repo}/releases/download/v${pkgver}/Maryanne-x86_64.AppImage"
  "maryanne.desktop::https://github.com/${release_repo}/releases/download/v${pkgver}/maryanne.desktop"
  "maryanne.png::https://github.com/${release_repo}/releases/download/v${pkgver}/maryanne.png"
)
sha256sums=(
  '7cce6def3f527c217de7edf98cc1f7f95b3b651e17a8f80356dfc01a4268288e'
  '8fcdd0bdfda339ee543d62c39d91580074212c681a1e477d7f717578fbf71c00'
  '93e729a1fb386fbdeb95f1d5ebc0bc03d2384abe3bf1f81152869ce6b07d30dd'
)

package() {
  install -Dm755 "maryanne-${pkgver}.AppImage" \
    "${pkgdir}/opt/maryanne/Maryanne-x86_64.AppImage"
  install -Dm644 maryanne.desktop \
    "${pkgdir}/usr/share/applications/maryanne.desktop"
  install -Dm644 maryanne.png \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/maryanne.png"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/maryanne/Maryanne-x86_64.AppImage \
    "${pkgdir}/usr/bin/maryanne"
}
