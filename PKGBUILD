# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=wled-gui-appimage

pkgver=0.7.1
pkgrel=1
pkgdesc="Cross-platform desktop app for WLED"

arch=('any')

_repo=w00000dy/WLED-GUI
url="https://github.com/$_repo/"
license=('MIT')

depends=()
makedepends=()
options=(!strip)

source=(
  "$url/releases/download/v${pkgver}/WLED-${pkgver}-Linux.AppImage"
  "wled-gui.png::https://raw.githubusercontent.com/$_repo/master/build/icon.png"
  "wled-gui.desktop"
)
sha256sums=('1c22dcb984b9774e674a78148531062b09bc52de9214d458b0a66faa6177ea89'
            '3369a53e6165e31b4aad1bec38bd88c67bca058156520becccf5e3c32a67bccc'
            '1e29ad4b045638175ea8cdcf099ef45a59a70a4e807672aef039308a302573c6')

package() {
  install -D -m 755 "WLED-${pkgver}-Linux.AppImage" "$pkgdir/usr/bin/wled-gui"
  install -D -m 644 "wled-gui.png"              -t "$pkgdir/usr/share/pixmaps"
  install -D -m 644 "$srcdir/wled-gui.desktop"   -t "$pkgdir/usr/share/applications"
}
