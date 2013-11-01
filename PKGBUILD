# Contributor: Jan Cholasta <grubber@grubber.cz>

pkgname=heretic1-wad
pkgver=1.2
pkgrel=1
pkgdesc="The Heretic shareware IWAD (game data)"
arch=('any')
url="http://www.idsoftware.com/games/vintage/heretic"
license=('custom')
source=(ftp://ftp.fu-berlin.de/pc/msdos/games/idgames/idstuff/heretic/htic_v12.zip)
md5sums=('420b23b3d8f2cbd164c121369eaa2b09')

build() {
  cd "$srcdir"

  cat HTIC_V12.1 HTIC_V12.2 > HTIC_V12.EXE
  unzip -o HTIC_V12.EXE HERETIC1.WAD LICENSE.DOC || return 1

  install -Dm644 HERETIC1.WAD "$pkgdir"/usr/share/games/heretic/heretic1.wad
  install -Dm644 LICENSE.DOC "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mkdir -p "$pkgdir"/usr/share/doom
  ln -s /usr/share/games/heretic/heretic1.wad "$pkgdir"/usr/share/doom/heretic1.wad
}
