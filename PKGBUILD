# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=minimodem
pkgver=0.23
pkgrel=1
pkgdesc='A tool to (de)code modem audio'
arch=('i686' 'x86_64')
url='http://www.whence.com/minimodem/'
license=('GPL')
depends=('fftw')
optdepends=('libpulse' 'alsa-lib')
makedepends=('libpulse' 'alsa-lib')
source=("http://www.whence.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
sha512sums=('588d20dc5cf56b6ac5baab24cef203423a253ffff7e9e3e8b75c040457cd6da449adf51d0b8614973b9c3be69ee2055ea36b5aa82b080920dc15b19d30a7fea2')

# vim: set noexpandtab ts=8:
