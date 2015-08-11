pkgname=guile-ncurses
pkgver=1.6
pkgrel=1
pkgdesc='Guile bindings for the GNU NCurses library'
arch=(any)
license=(GLPL3)
depends=(guile ncurses libunistring)
url=http://www.gnu.org/software/guile-ncurses/
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=(9f158bfdae0ce424a104136b3306a108)

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-ncursesw --with-guilesitedir="$(guile-config info sitedir)"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}