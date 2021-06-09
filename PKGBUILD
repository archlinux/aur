# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=cpl
pkgver=7.1.4
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
sha256sums=('cb43adba7ab15e315fbfcba4e2d8b88fa56d29a5a16036a7f082621b8416bd6c')


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

