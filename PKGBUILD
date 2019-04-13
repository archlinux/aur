# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname="brlaser"
pkgver=4
pkgrel=2
pkgdesc="CUPS driver for the Brother DCP-7065DN"
arch=('x86_64' 'armv7h')
url="https://github.com/pdewacht/brlaser"
license=('GPL2')
depends=('cups')
makedepends=('cmake')
source=("https://github.com/pdewacht/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1e08091adc371a35f75c245fd86f132aae7811a00bd7e9d194c47038dc9aa29296fbf8769cef6b8ea42d82467857195ba8024a9d6de8048174ecc44e0bb76067')

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
