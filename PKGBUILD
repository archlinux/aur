# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-calculator
arch=("x86_64")
depends=("qt5-tools" "qt5-quickcontrols2")
makedepends=("extra-cmake-modules")
pkgdesc="A simple calculator."
pkgrel=1
pkgver=0.6.2
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a0a1d22cb41ed3a26318e373003602ccf7ade740391f7d32714315bf5120eff0')

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
