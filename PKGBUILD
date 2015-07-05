pkgname=siril
pkgver=0.9.0rc1
pkgrel=1
pkgdesc="Siril is an astronomical image processing software for Linux. (IRIS clone)"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('gtk3' 'fftw' 'cfitsio' 'gsl' 'libconfig')
makedepends=('subversion')
url="http://free-astro.vinvin.tf/index.php/Siril"
optdepends=('libpng: PNG import support'
'libjpeg: JPEG import and export support'
'libtiff: TIFF import and export support'
'libraw: DSLR RAW images import'
'ffms2: films native support as image sequences'
'opencv: rotate and resize images'
)
source=("http://free-astro.vinvin.tf/download/siril-0.9.0-rc1.tar.gz")
sha1sums=('17f9dcb8912a1593455b8e3382d60a8fc288b195')

build() {
	cd "${pkgname}"
	aclocal && autoconf && autoheader && automake --add-missing
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" install
}

