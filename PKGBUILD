# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=minimodem
pkgver=0.24
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

# vim: set noexpandtab ts=8:
sha512sums=('5c3a5e6f185d4b09c5f24d776393f2e2d5d787c097c44490905119513b9b39db53b7f2f7e624a4b527e8e8e827a5b99af6b0df5ca525046f60b49fe9ba2b0ceb')
