# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-qt-plugins
arch=("x86_64")
depends=(
    "qt5-base" "qt5-tools" "qt5-x11extras" "libqt5xdg"
    "libdbusmenu-qt5" "libxcb"
)
makedepends=("extra-cmake-modules")
pkgdesc="Unify Qt application style of LingmoOS."
pkgrel=1
pkgver=2.0.1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('330bf2eacb3e7afdb55f046ebec372a706c65a1f9cef2d266c94683cde594690')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}
package() {
    cd $pkgname-$pkgver/build
    make DESTDIR="$pkgdir" install
}