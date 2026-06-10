# Maintainer: somnus0917 <somnus0917@users.noreply.github.com>
pkgname=superlabel-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Lightweight desktop annotation tool for object detection datasets"
arch=('x86_64')
url="https://github.com/somnus0917/superlabel"
license=('unknown')
depends=('fuse2' 'webkit2gtk-4.1' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'libsoup3' 'pango')
provides=('superlabel')
conflicts=('superlabel')
options=('!strip')
source=(
  "superlabel-${pkgver}.AppImage::https://github.com/somnus0917/superlabel/releases/download/v${pkgver}/superlabel_${pkgver}_amd64.AppImage"
  "superlabel.sh"
  "superlabel.desktop"
  "superlabel.png::https://github.com/somnus0917/superlabel/raw/v${pkgver}/src-tauri/icons/icon.png"
)
sha256sums=('d456e6408821f9be76e6cecd58a5b8a1da0803c9db0ddb1ef1613b3d7c77876b'
            'cfab409231dbb9773fd2062085a3e2a807ddf4ec7c1352d41eb4a5737d2fc387'
            '664056d4e98993590cd4e210e6b65a95e2e6ebe94d37fe8a27d0e6e65941f216'
            '3bf049a9b66d1a355338d46940fe502b9206ff02a4fa89d5034991b8259104b4')

package() {
  install -Dm755 "superlabel-${pkgver}.AppImage" "${pkgdir}/opt/superlabel/superlabel.AppImage"
  install -Dm755 "superlabel.sh" "${pkgdir}/usr/bin/superlabel"
  install -Dm644 "superlabel.desktop" "${pkgdir}/usr/share/applications/superlabel.desktop"
  install -Dm644 "superlabel.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/superlabel.png"
}
