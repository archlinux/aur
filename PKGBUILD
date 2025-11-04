# Maintainer: Cristóbal Tapia <crtapia at gmail dot com>
pkgname=dpt-rp1-cups
pkgver=0.2.6
pkgrel=1
pkgdesc="CUPS driver for DPT-RP1 and similar devices"
arch=('any')
url='https://github.com/cristobaltapia/dpt-rp1-cups'
license=('MIT')
depends=('cups' 'dpt-rp1-py' 'notify-send.sh')
makedepends=('make')
source=( "https://github.com/cristobaltapia/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('46fba62ec642ccae85ff8ab73501863452f39fb40da32a28e3205cd247290cb1')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
