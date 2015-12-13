pkgname=siril
pkgver=0.9.1
pkgrel=1
pkgdesc="Siril is an astronomical image processing software for Linux. (IRIS clone)"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('gtk3' 'fftw' 'cfitsio' 'gsl' 'libconfig')
url="http://free-astro.vinvin.tf/index.php/Siril"
optdepends=('libpng: PNG import support'
'libjpeg: JPEG import and export support'
'libtiff: TIFF import and export support'
'libraw: DSLR RAW images import'
'ffms2: films native support as image sequences'
'opencv: rotate and resize images'
)

_pkgname="${pkgname}-${pkgver}"
source=("http://free-astro.vinvin.tf/download/${_pkgname}.tar.bz2")

md5sums=('4db46174f0b3c0c6c2d5de052f631590')

build() {
	cd "${_pkgname}"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

