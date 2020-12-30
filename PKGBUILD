
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=cstatus
pkgver=1.0.0
pkgrel=1
pkgdesc='statusbar for dwm written in C99.'
arch=('x86_64')
url='https://git.sr.ht/~andreafeletto/cstatus'
license=('MIT')
depends=('libx11' 'alsa-lib')
provides=('cstatus')
conflicts=('cstatus-git')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~andreafeletto/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('24b5738339608542faf38f0af83376364856fd5966418ddfeed4a11fd011da81')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
