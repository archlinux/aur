# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=fortune-mod-parks-and-recreation
pkgver=1.1
pkgrel=1
pkgdesc="Parks and Recreation fortune cookie file"
url="https://en.wikiquote.org/wiki/Parks_and_Recreation_(season_7)"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=(parks-and-recreation.1-3 parks-and-recreation.4-7)
md5sums=('df9af1e1bb0ea8f5495337322d59418b' '68f6269ae1ea7d253190beda7f59616b')

build() {
  cd "$srcdir"

  # The file had to be split in two due to the AUR's 256 KB file limitation (total is 257 KB)
  cat parks-and-recreation.1-3 parks-and-recreation.4-7 > parks-and-recreation
  strfile parks-and-recreation parks-and-recreation.dat
}

package () {
  install -D -m644 parks-and-recreation $pkgdir/usr/share/fortune/parks-and-recreation
  install -D -m644 parks-and-recreation.dat $pkgdir/usr/share/fortune/parks-and-recreation.dat
}
