# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-gtk-themes
arch=("x86_64")
depends=()
makedepends=("extra-cmake-modules")
pkgdesc="GTK themes for Lingmo OS"
pkgrel=1
pkgver=2.0.0

url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('66b55621337316e30b708dc8284d47d2943c9e00bdde7b1b4f2704012f17583e')

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