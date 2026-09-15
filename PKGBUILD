# Maintainer: Cristóbal Tapia <crtapia at gmail dot com>
pkgname=dpt-rp1-cups
pkgver=0.2.7
pkgrel=1
pkgdesc="CUPS driver for DPT-RP1 and similar devices"
arch=('any')
url='https://github.com/cristobaltapia/dpt-rp1-cups'
license=('MIT')
depends=('cups' 'dpt-rp1-py' 'notify-send.sh')
makedepends=('make')
source=( "https://github.com/cristobaltapia/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7e48bb0462b0b2d233a88f9065f9706dd3f8513ebf002c8617c19f20386b7c58')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
