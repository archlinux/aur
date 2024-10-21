# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-statusbar
arch=("x86_64")
depends=(
    "kwindowsystem5" "qt5-base" "qt5-x11extras" "qt5-quickcontrols2"
    "qt5-tools"
)
makedepends=("extra-cmake-modules")
pkgdesc="The status bar for LingmoOS."
pkgrel=1
pkgver=2.0.1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e45b66368435be76cfc1b4c5d9049bc8d61c0b3cada743e5bfc351f0d4f1786d')

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
