# Package build for libnoise2d from git (https://github.com/planeworld/libnoise2d)
# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Noise library for 2D data'
_gitname=('libnoise2d')
pkgname=('libnoise2d')
provides=('libnoise2d')
pkgver=1.2.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/planeworld/libnoise2d"
depends=('gcc-libs')
makedepends=('gcc-libs' 'git' 'cmake')
source=("https://github.com/planeworld/libnoise2d/archive/v${pkgver}.tar.gz")
sha256sums=('db733b981ffbb3ab4cebf6c7a01ef28d3ed071050436fed7a4d4ed43e2e6d7f0')

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
