# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=opustags
pkgver=1.10.1
pkgrel=1
pkgdesc='Opus tags editor'

url='https://github.com/fmang/opustags'
license=('BSD3')

arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
depends=('libogg')
makedepends=('cmake' 'pkgconf')

source=("https://github.com/fmang/opustags/archive/$pkgver.tar.gz")
sha256sums=('703096e9c41481e30ab90eefdd8fafc4c3a138998b3f8281aa4f023e7058bc86')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
