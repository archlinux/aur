# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname="brlaser"
pkgver=5
pkgrel=1
pkgdesc="CUPS driver for the Brother DCP-7065DN"
arch=('x86_64' 'armv7h')
url="https://github.com/pdewacht/brlaser"
license=('GPL2')
depends=('cups')
makedepends=('cmake')
source=("https://github.com/pdewacht/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('eeb3b37beb5f9a1b6bea456fd9b5e6fc346a7d2dcf9800fa03dfae85f929de46975e4c69a24c9771049ed18847307418fd04d3fe3078b01c60ff19d12ce85058')

build() {
	cd "${pkgname}-${pkgver}"
	cmake .
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
