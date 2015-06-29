# Maintainer: Andreas Wagner (pointfree) <andreas.wagner@lowfatcomputing.org>
# Contributor: Robert Ransom <rransom.8774@gmail.com>
pkgname=ired
pkgver=0.5
pkgrel=1
pkgdesc='Minimalistic hex editor'
arch=('i686' 'x86_64')
url='http://radare.org/'
license=('unknown')
depends=('sh')
source=("http://radare.org/get/$pkgname-$pkgver.tar.gz")
sha512sums=('15ab268cbf28ec4520eb1fd225088dee71bf3e889208df8bdc26025ac41fc3994838606ca230cac847152c391a6e79f51c28074b624bbe0dc872444e71a21cc2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
