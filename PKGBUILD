# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-calculator
arch=("x86_64")
depends=("qt5-tools" "qt5-quickcontrols2")
makedepends=("extra-cmake-modules")
pkgdesc="A simple calculator."
pkgrel=1
pkgver=0.6.1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b0de29daeb1028dfbdf56619f88c464fb4273beade471f0d9896a0736e10c4ad')

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
