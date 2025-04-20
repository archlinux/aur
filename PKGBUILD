# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-wallpapers
arch=("x86_64")
depends=()
makedepends=("extra-cmake-modules")
pkgdesc="Built-in wallpapers for LingmoOS."
pkgrel=1
pkgver=3.0.1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('b337b6dce57b4b3a8600a2e5adb5d1ea09e731e6a40279b08ad2f4f73a3b7aa8')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}
package() {
    cd ${pkgname}-${pkgver//_/-}/build
    make DESTDIR="${pkgdir}" install
}

