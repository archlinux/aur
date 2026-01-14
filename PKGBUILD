pkgname="imppg"
pkgver=2.1.0
pkgrel=1
pkgdesc="ImPPG (Image Post-Processor)"
arch=("x86_64")
url='http://greatattractor.github.io/imppg/'
license=('GPL3')
makedepends=('cmake' 'wxwidgets-gtk3' 'cfitsio' 'glew' 'freeimage' 'boost')
source=("https://github.com/GreatAttractor/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('59d2d1729452996ecdca6e4eaa4332c3291afe84f4b1bd7b60e2cfaae6691b89')

build() {
    cd ${pkgname}-${pkgver}
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ./
    make
}

package() {
    cd ${pkgname}-${pkgver}
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}
