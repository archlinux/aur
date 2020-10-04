# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=opustags
pkgver=1.4.0
pkgrel=1
pkgdesc='Opus tags editor'

url='https://github.com/fmang/opustags'
license=('BSD3')

arch=('i686' 'x86_64' 'armv7h' 'armv6h')
depends=('libogg')
makedepends=('cmake')

source=("https://github.com/fmang/opustags/archive/$pkgver.tar.gz")
sha256sums=('6d5a2baf81e3a303b7e640c3e3aca43a47cbe9f32f9fbdb7b6bc13e34a492d55')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
