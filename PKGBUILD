# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=tarlz
pkgver=0.16
pkgrel=1
epoch=
pkgdesc='Archiver with multimember lzip compression'
arch=('x86_64')
url='https://www.nongnu.org/lzip/tarlz.html'
license=('GPL2')
depends=('lzlib' 'gcc-libs' 'glibc')
makedepends=('make')
source=("http://download.savannah.gnu.org/releases/lzip/tarlz/tarlz-${pkgver}.tar.lz")
sha512sums=('619cb5807e58cbb267e0bd4780e578a069de2bd721c4ff84416b0d551d79c4172d453ee7e0c610b3c5da5a9f5068f5d134638c39ab67c05a5e853257abb2ff00')

build() {
	cd "${srcdir}/tarlz-${pkgver}"

	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/tarlz-${pkgver}"

	make check
}

package() {
	cd "${srcdir}/tarlz-${pkgver}"

	make DESTDIR="$pkgdir/" install
}
