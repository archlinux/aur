# Maintainer: somnus0917 <somnus0917@users.noreply.github.com>
pkgname=superlabel-bin
pkgver=0.1.3
pkgrel=3
pkgdesc="Lightweight desktop annotation tool for object detection datasets"
arch=('x86_64')
url="https://github.com/somnus0917/superlabel"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg')
provides=('superlabel')
conflicts=('superlabel')
options=('!strip')
source=(
  "superlabel-${pkgver}.deb::https://github.com/somnus0917/superlabel/releases/download/v${pkgver}/superlabel_${pkgver}_amd64.deb"
  "superlabel.desktop"
  "superlabel.png::https://github.com/somnus0917/superlabel/raw/v${pkgver}/src-tauri/icons/icon.png"
)
sha256sums=('SKIP'
            '664056d4e98993590cd4e210e6b65a95e2e6ebe94d37fe8a27d0e6e65941f216'
            '3bf049a9b66d1a355338d46940fe502b9206ff02a4fa89d5034991b8259104b4')

package() {
  cd "${srcdir}"
  bsdtar -x -f "${srcdir}/superlabel-${pkgver}.deb"
  bsdtar -x -f "${srcdir}/data.tar.gz" -C "${pkgdir}"
  
  install -Dm644 "superlabel.desktop" "${pkgdir}/usr/share/applications/superlabel.desktop"
  install -Dm644 "superlabel.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/superlabel.png"
}
