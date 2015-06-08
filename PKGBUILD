# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mktiupgrade
pkgver=1.1.4
pkgrel=1
license=('MIT')
pkgdesc='Builds and signs OS upgrades for Texas Instruments calculators'
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/mktiupgrade'
source=("https://github.com/KnightOS/mktiupgrade/archive/${pkgver}.tar.gz")
sha1sums=('d0aa9aafdd863a14ace0e1779ac3f5a6fc096ccd')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
