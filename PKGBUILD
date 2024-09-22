# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-launcher
arch=("x86_64")
depends=("kwindowsystem5" "qt5-base" "qt5-quickcontrols2" "qt5-tools")
makedepends=("extra-cmake-modules")
pkgdesc="Application launcher for Lingmo."
pkgrel=1
pkgver=2.0.0
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eaa7cb7eb031a0f29930cb19f4251d2291a973327af9bddbbf5ff36739bc999f')

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
