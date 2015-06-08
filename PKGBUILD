# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mkrom
pkgver=1.0.1
pkgrel=1
license=('MIT')
pkgdesc='Writes files into ROM images for TI calculators'
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/mkrom'
source=("https://github.com/KnightOS/mkrom/archive/${pkgver}.tar.gz")
sha1sums=('fa37edabf09592d745bd396f904a019c5336cfe9')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
