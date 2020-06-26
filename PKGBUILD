# Package build for libnoise2d from git (https://github.com/planeworld/libnoise2d)
# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Noise library for 2D data'
_gitname=('libnoise2d')
pkgname=('libnoise2d')
provides=('libnoise2d')
pkgver=1.2.1
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/planeworld/libnoise2d"
depends=('gcc-libs')
makedepends=('gcc-libs' 'git' 'cmake')
source=("https://github.com/planeworld/libnoise2d/archive/v${pkgver}.tar.gz")
sha256sums=('e5f222db72e027cd96e1778573e553a22a518d71a7256b74a6b32c7463c2c04e')

build() {
	if [ ! -d "${srcdir}/build" ]; then
		mkdir -p "${srcdir}/build"
	fi

	cd "${srcdir}/build"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr "../${pkgname}-${pkgver}"
	make
	
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install	
}
