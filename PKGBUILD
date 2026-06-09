# Maintainer: somnus0917 <somnus0917@users.noreply.github.com>
pkgname=superlabel-bin
pkgver=0.1.2
pkgrel=2
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
sha256sums=(
  '846fd8b0209f208afb46d2dbc0a95424ede66f3f2201cff48f510dec1763c68b'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "superlabel-${pkgver}.AppImage" "${pkgdir}/opt/superlabel/superlabel.AppImage"
  install -Dm755 "superlabel.sh" "${pkgdir}/usr/bin/superlabel"
  install -Dm644 "superlabel.desktop" "${pkgdir}/usr/share/applications/superlabel.desktop"
  install -Dm644 "superlabel.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/superlabel.png"
}
