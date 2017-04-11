pkgname=guile-ncurses
pkgver=2.2
pkgrel=1
pkgdesc='Guile bindings for the GNU NCurses library'
arch=(any)
license=(GLPL3)
depends=(guile ncurses libunistring)
url=http://www.gnu.org/software/guile-ncurses/
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=(33a04e48df0a0c84c7b91cbaa4d42444)

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-ncursesw
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}