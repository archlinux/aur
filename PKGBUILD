# Maintainer: Reynaldo Gil <gilcu3@gmail.com>

pkgname=desproxy
pkgver=0.1.1
pkgrel=1
pkgdesc="TCP tunnel for HTTP proxies"
arch=('i686' 'x86_64')
url="https://github.com/gilcu3/desproxy/"
license=('GPL2')
depends=('glibc')
makedepends=('')
source=("git+https://github.com/gilcu3/desproxy/")
md5sums=('SKIP')
build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make

}

package() {
  cd "$pkgname"
  echo "$pkgdir"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 doc/manual-en.html "$pkgdir/usr/share/doc/$pkgname/manual.html"
  install -Dm644 doc/config-en.html "$pkgdir/usr/share/doc/$pkgname/config.html"
}

