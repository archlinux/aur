# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-texteditor
arch=("x86_64")
depends=("qt5-base" "qt5-quickcontrols" "qt5-tools" "syntax-highlighting5")
makedepends=("extra-cmake-modules")
pkgdesc="An easy-to-use and aesthetically pleasing text editor for Lingmo OS."
pkgrel=1
pkgver=2.0.0
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d8ac2f6e5e3af0ab841c6141c2d9b2bb1bb32c43367565e330f05adc7b04eb74')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}
package() {
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
