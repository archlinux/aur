# Contributor: Jan Cholasta <grubber@grubber.cz>

pkgname=doom1-wad
pkgver=1.9
pkgrel=2
pkgdesc="The Doom shareware IWAD (game data)"
arch=('any')
url="http://www.idsoftware.com/games/doom/doom-ultimate"
license=('custom')
source=(ftp://ftp.fu-berlin.de/pc/msdos/games/idgames/idstuff/doom/doom19s.zip \
        LICENSE)
md5sums=('244d181457c9be5f28b91b488e67e042'
         '8a65f7e6e006f3e769f8172115bbf7b6')

build() {
  cd "$srcdir"

  cat DOOMS_19.1 DOOMS_19.2 > DOOMS_19.EXE
  unzip -o DOOMS_19.EXE DOOM1.WAD || return 1

  install -Dm644 DOOM1.WAD "$pkgdir"/usr/share/games/doom/doom1.wad
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mkdir -p "$pkgdir"/usr/share/doom
  ln -s /usr/share/games/doom/doom1.wad "$pkgdir"/usr/share/doom/doom1.wad
}
