# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Tomasz Cielecki <tomasz@ostebaronen.dk>
pkgname=sipcalc
pkgver=1.1.6
pkgrel=4
pkgdesc="an advanced console based ip subnet calculator."
arch=('x86_64')
url="https://www.routemeister.net/projects/sipcalc/"
license=('BSD')
depends=('glibc')
source=(https://www.routemeister.net/projects/sipcalc/files/$pkgname-$pkgver.tar.gz)
sha256sums=('cfd476c667f7a119e49eb5fe8adcfb9d2339bc2e0d4d01a1d64b7c229be56357')

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
