# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Tomasz Cielecki <tomasz@ostebaronen.dk>
pkgname=sipcalc
pkgver=1.1.6
pkgrel=4
pkgdesc="an advanced console based ip subnet calculator."
arch=('x86_64')
url="http://www.routemeister.net/projects/sipcalc/"
license=('BSD')
depends=('glibc')
source=(http://www.routemeister.net/projects/sipcalc/files/$pkgname-$pkgver.tar.gz)
md5sums=('e431c64387f2c8d20e96ad1d7931a845')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
