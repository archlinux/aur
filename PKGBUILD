# Maintainer: Akshay Nair <phenax5@gmail.com>
pkgname=bslock
pkgver=0.0.1
pkgrel=1
pkgdesc="A better screen locker for X (a prettier slock fork)"
arch=('x86_64')
url="https://github.com/phenax/bslock"
license=('MIT')
depends=('libxext' 'libxrandr')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/phenax/$pkgname/archive/$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
