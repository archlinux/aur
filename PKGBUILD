# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=kpack
pkgver=1.0.10
pkgrel=1
license=('MIT')
pkgdesc='Manipulates KnightOS software packages'
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/kpack'
source=("https://github.com/KnightOS/kpack/archive/${pkgver}.tar.gz")
sha1sums=('f7d42966e2db7620fd0416b98063d4590c721e38')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
