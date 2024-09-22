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
pkgver=2.0.0
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('06655741c454cee4728c2cf3e34ca76678eed4af86a620945767de970f0d89ca')

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
