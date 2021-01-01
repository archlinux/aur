# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=opustags
pkgver=1.6.0
pkgrel=1
pkgdesc='Opus tags editor'

url='https://github.com/fmang/opustags'
license=('BSD3')

arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
depends=('libogg')
makedepends=('cmake')

source=("https://github.com/fmang/opustags/archive/$pkgver.tar.gz")
sha256sums=('0f82703a49b35d44503c53bb596129e89ec061fb1f6e82363f982d1e35377dce')

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
