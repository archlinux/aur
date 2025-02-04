# Maintainer: robertfoster

pkgname=perp
pkgver=2.07
pkgrel=2
arch=(i686 x86_64)
pkgdesc="Perp, aka the perpetrator, a persistent process supervisor."
url="http://b0llix.net/perp/"
license=('GPL')
source=(http://b0llix.net/perp/distfiles/$pkgname-$pkgver.tar.gz)
install=perp.install

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  mv $pkgdir/usr/sbin $pkgdir/usr/bin
}

sha256sums=('1222fe31c16014d8b2a78416f93ba9f8c31eddbc381adc9021fa5d9764475815')
