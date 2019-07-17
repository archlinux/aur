# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=tarlz
pkgver=0.15
pkgrel=1
epoch=
pkgdesc='Archiver with multimember lzip compression'
arch=('x86_64')
url='https://www.nongnu.org/lzip/tarlz.html'
license=('GPL2')
depends=('lzlib' 'gcc-libs' 'glibc')
makedepends=('make')
source=("http://download.savannah.gnu.org/releases/lzip/tarlz/tarlz-${pkgver}.tar.lz")
sha512sums=('83a8db474cd9c89fba3b68ba63aeafeaa1813cf089629e7df03b4b6c5ddb3b843a3ce073785b53e8d7f02ee0caea529d79c8dcbd755349dc6139e953390b5761')

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
