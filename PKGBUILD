
# Maintainer: NotRx <toby@soupcan.xyz>

pkgname=polymodloader-bin
pkgver=0.6.0
pkgrel=3
pkgdesc="A Mod Loader for PolyTrack"
arch=('x86_64')
url="https://codeberg.org/polytrackmods/PolyModLoader"
license=('unknown')
source=(
  "https://codeberg.org/polytrackmods/PolyModLoader/releases/download/v$pkgver-$pkgrel/linux.tar.gz"
  "pml.desktop"
  "icon.png"
)
sha256sums=(
  'd2e41e6ed604bb5d4bc78e1f0d9c1550da6cd94823efe2c5eab2de16200b8706'
  'SKIP'
  'SKIP'
)

package() {
  install -d "$pkgdir/usr/share/pml"
  cp -r "$srcdir/PolyModLoader-linux-x64/"* \
    "$pkgdir/usr/share/pml/"

  install -Dm644 "$srcdir/pml.desktop" \
    "$pkgdir/usr/share/applications/polymodloader.desktop"

  install -Dm644 "$srcdir/icon.png" \
    "$pkgdir/usr/share/pixmaps/pml.png"
}
