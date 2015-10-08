# Maintainer: Ilja Kartaschoff <ik@lowenware.com>
pkgname=webstuff
pkgver=0.7.9
pkgrel=3
pkgdesc="Lightweight C Library for web-applications development"
arch=('any')
url="http://www.lowenware.com/"
license=('BSD')
source=(http://www.lowenware.com/download/webstuff/$pkgname-$pkgver.tar.gz)
md5sums=('0d93eee6f6dda75d3452ff638b183d04')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --with-templight --with-opts-parser --with-conf-parser
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
