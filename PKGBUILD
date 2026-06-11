# Maintainer: somnus0917 <somnus0917@users.noreply.github.com>
pkgname=superlabel-bin
pkgver=0.1.3
pkgrel=2
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
  "superlabel.sh"
  "superlabel.desktop"
  "superlabel.png::https://github.com/somnus0917/superlabel/raw/v${pkgver}/src-tauri/icons/icon.png"
)
sha256sums=('SKIP'
            'cfab409231dbb9773fd2062085a3e2a807ddf4ec7c1352d41eb4a5737d2fc387'
            '664056d4e98993590cd4e210e6b65a95e2e6ebe94d37fe8a27d0e6e65941f216'
            '3bf049a9b66d1a355338d46940fe502b9206ff02a4fa89d5034991b8259104b4')

package() {
  bsdtar -x -f "${srcdir}/data.tar.xz" -C "${pkgdir}"
  
  install -Dm755 "superlabel.sh" "${pkgdir}/usr/bin/superlabel"
  install -Dm644 "superlabel.desktop" "${pkgdir}/usr/share/applications/superlabel.desktop"
  install -Dm644 "superlabel.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/superlabel.png"
}
