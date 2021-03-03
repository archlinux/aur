# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# Set it to compile with openblas-lapack

pkgname=cpl
pkgver=7.1.3
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
source=(ftp://ftp.eso.org/pub/dfs/pipelines/libraries/cpl/cpl-${pkgver}.tar.gz)
sha256sums=('04109613819b97273045102bd7acf52d13ee7f9217779f17ae2a170c491965c5')


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

