# Maintainer: Rekidaishi <rekidaishi at gmail>
pkgname=iroffer-dinoex
pkgver=3.31
pkgrel=1
pkgdesc="Dinoex version of iroffer."
arch=('i686' 'x86_64')
url="http://iroffer.dinoex.net"
makedepends=('ruby' 'geoip')
source=("http://iroffer.dinoex.net/$pkgname-$pkgver.tar.gz")
sha512sums=('677aa03a33b99d8062db077bba47fb18b2e9279243691981bbd09cb2859fcb4792e1383225b9698edb23370ce0f60667a09480644d31171e9a8234d80052dd80')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./Configure PREFIX=/usr -curl -geoip -ruby
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
