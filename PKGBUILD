# Maintainer: e5ten <e5ten.arch@gmail.com>
# Contributor: sxe <sxxe@gmx.de>
pkgname='qlipper'
pkgver=5.1.2
pkgrel=1
pkgdesc='Lightweight & cross-platform clipboard history applet based on qt'
arch=('i686' 'x86_64')
url="https://github.com/pvanek/${pkgname}"
license=('GPL2')
depends=('qt5-base')
makedepends=('cmake' 'ninja' 'qt5-tools' 'git')
source=("git+https://github.com/pvanek/${pkgname}#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cmake -G 'Ninja' -B "${srcdir}/build" \
		-DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
		"${srcdir}/${pkgname}"
    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
}

