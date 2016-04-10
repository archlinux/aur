# Maintainer: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>
pkgname=siril
pkgver=0.9.3
pkgrel=1
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('gtk3' 'fftw' 'cfitsio' 'gsl' 'libconfig')
url="https://free-astro.org/index.php/Siril"
optdepends=('libpng: PNG import'
'libjpeg: JPEG import and export'
'libtiff: TIFF import and export'
'libraw: DSLR RAW images import'
'giflib: animated GIF monochrome sequence export'
'ffms2: films native support as image sequences and import'
'opencv: rotate and resize images'
)

_pkgname="${pkgname}-${pkgver}"
source=("https://free-astro.org/download/${_pkgname}.tar.bz2")

sha1sums=('2dd678037184d0d1786054ed5f38fa08e527b3f3')

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

