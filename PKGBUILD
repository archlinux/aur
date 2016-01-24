# Maintainer: Ilja Kartaschoff <ik@lowenware.com>
pkgname=webstuff
pkgver=0.7.14
pkgrel=6
pkgdesc="Lightweight C Library for web-applications development"
arch=('any')
url="http://www.lowenware.com/"
license=('BSD')
source=(http://www.lowenware.com/download/webstuff/$pkgname-$pkgver.tar.gz)
md5sums=('84c767941a2b9654d2729e60d8b2d7f2')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --with-templight --with-opts-parser --with-conf-parser
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
