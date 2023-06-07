# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=opustags
pkgver=1.9.0
pkgrel=1
pkgdesc='Opus tags editor'

url='https://github.com/fmang/opustags'
license=('BSD3')

arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
depends=('libogg')
makedepends=('cmake' 'pkgconf')

source=("https://github.com/fmang/opustags/archive/$pkgver.tar.gz")
sha256sums=('ea937f48a011bbacf37324c159149625c1ab66110e6d279693a92659bd38cf02')

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
