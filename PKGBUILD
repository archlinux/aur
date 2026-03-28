# Contributor: mrbug
pkgname=freecell
pkgver=1.2.6
pkgrel=1
pkgdesc="A console (ncurses) version of the popular solitaire game Freecell."
arch=('i686' 'x86_64')
url="https://github.com/ostrosablin/freecell"
license=('GPL')
depends=('ncurses')
install=
source=('https://github.com/ostrosablin/freecell/archive/refs/tags/freecell-1.2.6.tar.gz')
md5sums=('505f2fc279a7c7779a049622dad65b61') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  for i in src/*;
  do
    sed -i 's/suite/suit/g' $i
  done

  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
