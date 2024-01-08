# Maintainer: Cristóbal Tapia <crtapia at gmail dot com>
pkgname=dpt-rp1-cups
pkgver=0.2.5
pkgrel=1
pkgdesc="CUPS driver for DPT-RP1 and similar devices"
arch=('any')
url='https://github.com/cristobaltapia/dpt-rp1-cups'
license=('MIT')
depends=('cups' 'dpt-rp1-py' 'notify-send.sh')
makedepends=('make')
source=( "https://github.com/cristobaltapia/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ebc233f446dd42573199b8c9c148ff6d37d26899f3dd3ce19deb2b2d4284284b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
