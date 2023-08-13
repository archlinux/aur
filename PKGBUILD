# Maintainer: badcast <lmecomposer@gmail.com>
pkgname=libacross
pkgver=1.0.0
pkgrel=0
url="https://github.com/badcast/lib-across"
pkgdesc="libacross path finder with across implementation"
arch=("any")
license=('GPL3')
depends=('make' 'cmake' 'pkgconf')
source=("git+${url}.git")
cksums=('SKIP')

build(){
   cmake -S "${srcdir}/lib-across" -B "${srcdir}/build" -DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/
}

check() {
	ctest "${srcdir}/build"
}

package(){
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
}
