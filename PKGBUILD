# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=opustags
pkgver=1.2.0
pkgrel=1
pkgdesc='Opus tags editor'

url='https://github.com/fmang/opustags'
license=('BSD3')

arch=('i686' 'x86_64' 'armv7h' 'armv6h')
depends=('libogg')
makedepends=('cmake')

source=("https://github.com/fmang/opustags/archive/$pkgver.tar.gz")
sha256sums=('69a866a1bc52ba61ff15aa3c30b9a0d4d36bf1de56d3ff1500908355a8696b44')

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
