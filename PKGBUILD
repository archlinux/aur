# Contributor: mrbug
pkgname=freecell
pkgver=1.0
pkgrel=4
pkgdesc="A console (ncurses) version of the popular solitaire game Freecell."
arch=('i686' 'x86_64')
url="http://www.linusakesson.net/software/freecell.php"
license=('GPL')
depends=('ncurses')
install=
source=('http://www.linusakesson.net/files/freecell-1.0.tar.gz')
md5sums=('d696de7f57d4f5c69659232aa50bd27d') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  for i in src/*;
  do
    sed -i 's/suite/suit/g' $i
  done

  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
