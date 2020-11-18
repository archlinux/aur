# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=opustags
pkgver=1.5.0
pkgrel=1
pkgdesc='Opus tags editor'

url='https://github.com/fmang/opustags'
license=('BSD3')

arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
depends=('libogg')
makedepends=('cmake')

source=("https://github.com/fmang/opustags/archive/$pkgver.tar.gz")
sha256sums=('ec7479f61fb8fba6804f24675369be7f03d8e8cad348f068bd59416720199007')

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
