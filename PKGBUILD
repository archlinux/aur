pkgname=omping
pkgver=0.0.5.r1.g08a31ec
pkgrel=1
pkgdesc="Open Multicast Ping, a tool for testing IPv4/IPv6 multicast connectivity"
url="https://github.com/troglobit/omping"
arch=(i686 x86_64)
makedepends=(git)
_commit=08a31ec1a6eb4e8f88c301ef679c3b6f9893f333
source=("git+https://github.com/troglobit/omping#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed "s/-/.r/; s/-/./"
}

build() {
	cd "$srcdir/$pkgname"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
