pkgname="imppg"
pkgver=1.9.1
pkgrel=2
pkgdesc="ImPPG (Image Post-Processor)"
arch=("x86_64")
url='http://greatattractor.github.io/imppg/'
license=('GPL3')
makedepends=('cmake' 'wxwidgets-gtk3' 'cfitsio' 'glew' 'freeimage' 'boost')
source=("https://github.com/GreatAttractor/${pkgname}/archive/refs/tags/v${pkgver}-beta.tar.gz")
sha256sums=('e63df6e5a12027208f2da4a6b62c5bebfedd8e1b627ac81cd21069fb06e62335')

build() {
    cd ${pkgname}-${pkgver}-beta
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ./
    make
}

package() {
    cd ${pkgname}-${pkgver}-beta
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}
