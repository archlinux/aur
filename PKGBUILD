# Maintainer: Fabian Hirschmann <fabian@hirschmann.email>
pkgname=sleeptimer
pkgver=0.4.2
pkgrel=3
pkgdesc="Simple single button lirc-aware shut down timer with an OSD"
arch=('i686' 'x86_64')
url="http://www.github.com/fhirschmann/sleeptimer/"
license=('GPL3')
depends=('xosd' 'gettext')
optdepends=('lirc: remote control support')
makedepends=('make' 'autoconf' 'help2man')
source=("https://github.com/fhirschmann/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('9be1c0854294754cd5ae5075eac78a63')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
