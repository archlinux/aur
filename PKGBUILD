# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# Set it to compile with openblas-lapack

pkgname=cpl
pkgver=7.1.2
pkgrel=1
pkgdesc="ESO Common Pipeline Library"
url="https://www.eso.org/sci/software/cpl/index.html"
arch=('x86_64')
license=('GPL2')
depends=('fftw' 'wcslib' 'cfitsio')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(ftp://ftp.eso.org/pub/dfs/pipelines/libraries/cpl/cpl-7.1.2.tar.gz)
sha256sums=('b6d20752420e2333e86d9a08c24a08057351a9fef97c32f5894e63fbfece463a')


build() {


	cd $srcdir/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {

	cd $srcdir/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install

	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

