# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=heretic1-wad
pkgver=1.2
pkgrel=2
pkgdesc="The Heretic shareware IWAD (game data)"
arch=('any')
url="https://web.archive.org/web/20160603151059/https://www.ravensoftware.com/games/heretic/view-game/"
license=('custom')
makedepends=('unzip')
source=(ftp://ftp.fu-berlin.de/pc/msdos/games/idgames/idstuff/heretic/htic_v12.zip)
sha256sums=('5ffbb47e4a5750fef144c312973ee5782266b4a63474b77478103b6c1aaed39d')

prepare() {
  cat HTIC_V12.1 HTIC_V12.2 > HTIC_V12.EXE
  unzip -o HTIC_V12.EXE HERETIC1.WAD LICENSE.DOC
}

package() {
  install -Dm644 HERETIC1.WAD "$pkgdir/usr/share/games/heretic/heretic1.wad"

  mkdir -p "$pkgdir/usr/share/doom"
  ln -s /usr/share/games/heretic/heretic1.wad "$pkgdir/usr/share/doom/heretic1.wad"

  install -Dm644 LICENSE.DOC "$pkgdir/usr/share/licenses/$pkgname/license.doc"
}
