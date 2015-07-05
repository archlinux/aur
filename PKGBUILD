pkgname=rune-hov-expansion
_pkgname=rune
pkgver=1.07
pkgrel=1
pkgdesc='Multiplayer expansion pack for Rune'
arch=('i686' 'x86_64')
url='http://www.lokigames.com/products/hov/'
license=('custom')
depends=('rune')

package() {
  install -d "$pkgdir/opt/$_pkgname/Maps" "$pkgdir/opt/$_pkgname/Sounds" "$pkgdir/opt/$_pkgname/System" "$pkgdir/opt/$_pkgname/Textures"

  msg2 "Please type absolute path to mounted Rune HoV CD (e.g. /media/cdrom)"
  read hov_cd
  mkdir -p "$srcdir/hov"
  cd "$srcdir/hov"
  tar xf "$hov_cd/data-HOV.tar.gz"
  install -m 644 Maps/*.run "$pkgdir/opt/$_pkgname/Maps"
  install -m 644 Sounds/*.uax "$pkgdir/opt/$_pkgname/Sounds"
  install -m 644 System/*.{int,u} "$pkgdir/opt/$_pkgname/System"
  install -m 644 Textures/*.utx "$pkgdir/opt/$_pkgname/Textures"

  cd "$hov_cd"
  install -m 644 README-HOV "$pkgdir/opt/$pkgname"
}

# vim:set ts=2 sw=2 et:
