# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=genkfs
pkgver=1.2.2
pkgrel=1
license=('MIT')
pkgdesc='Builds KFS filesystems for KnightOS'
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/genkfs'
source=("https://github.com/KnightOS/genkfs/archive/${pkgver}.tar.gz")
sha1sums=('5c78d73dbf643f6f3c16fc9c6cde316268cd217f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
