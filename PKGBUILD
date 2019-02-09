# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=mdns-scan
pkgver=0.5
pkgrel=5
pkgdesc="Scan mDNS/DNS-SD published services on the local network"
arch=("x86_64")
url="http://0pointer.de/lennart/projects/mdns-scan/"
license=("GPL2")
depends=("glibc")
source=("http://0pointer.de/lennart/projects/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("9f036172ffe9f51c2c6e4db5bb7134df")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm755 mdns-scan   "$pkgdir"/usr/bin/mdns-scan
	install -Dm644 mdns-scan.1 "$pkgdir"/usr/share/man/man1/mdns-scan.1
}

