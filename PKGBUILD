pkgname=omping
pkgver=0.0.4
pkgrel=1
pkgdesc="Open Multicast Ping, a tool for testing IPv4/IPv6 multicast connectivity"
url="https://github.com/troglobit/omping"
arch=(i686 x86_64)
source=("https://fedorahosted.org/releases/o/m/omping/omping-$pkgver.tar.gz")
sha256sums=('8909616b007139138d9d1cb51cc234edaf728f20a26897ef2959a570da02dc0a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
