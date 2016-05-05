# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>

pkgname=lcm
pkgver=1.3.1
pkgrel=5
pkgdesc="Lightweight real-time networking library"
arch=('i686' 'x86_64' 'armv7h')
url="http://code.google.com/p/lcm/"
license=('LGPL')
depends=('glib2')
optdepends=(
	'java-environment: support for lcm-spy and other GUI tools'
	'ttf-dejavu: support for lcm-spy and other GUI tools'
)
makedepends=()
source=(http://github.com/lcm-proj/lcm/releases/download/v${pkgver}/$pkgname-$pkgver.zip)

md5sums=('61ea232993a750285686cd63f1cfcd3f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
