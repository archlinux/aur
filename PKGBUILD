# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname="brlaser"
pkgver=6
pkgrel=3
pkgdesc="Brother laser printer driver"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/pdewacht/brlaser"
license=('GPL2')
depends=('cups')
makedepends=('cmake')
source=("https://github.com/pdewacht/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('d7e0e63b64be9ae7633381622c13ba0589e5fe58d277212bce4f5bb712a291ed0b0f2ac3d450dce61c7f9052c1ce7323fec66b5005c5cb3da1314b284d20f06f')

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
