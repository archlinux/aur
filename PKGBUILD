# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-sddm-theme
arch=("x86_64")
depends=("sddm")
makedepends=("extra-cmake-modules")
pkgdesc="SDDM theme for LingmoOS"
pkgrel=1
pkgver=1.9.9
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4550ab7d84ca47266e6cadbec45e5c2677b6adb5fc8bb4f97f27768c8083508b')

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
