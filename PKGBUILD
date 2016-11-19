pkgname=guile-ncurses
pkgver=2.1
pkgrel=1
pkgdesc='Guile bindings for the GNU NCurses library'
arch=(any)
license=(GLPL3)
depends=(guile ncurses libunistring)
url=http://www.gnu.org/software/guile-ncurses/
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=(d978009acaf1d0fc5041f04743172ce2)

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-ncursesw
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}