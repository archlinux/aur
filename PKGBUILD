# Maintainer: M0Rf30

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

md5sums=('a2acc7425d556d9635a25addcee9edb5')
