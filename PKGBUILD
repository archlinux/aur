# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-screenlocker
arch=("x86_64")
depends=(
    "qt5-base" "qt5-declarative" "qt5-x11extras" "dbus" 
    "libx11"
)
makedepends=("extra-cmake-modules")
pkgdesc="Screenlocker for LingmoOS."
pkgrel=1
pkgver=2.0.1

url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e863a4826944da69e5aa791a8049a2350a49a1f253b3522d7e1f099d947a3959')

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