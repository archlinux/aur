# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-terminal
arch=("x86_64")
depends=(
    "qt5-base" "qt5-declarative" "qt5-quickcontrols2" "qt5-x11extras"
    "qt5-tools" "qt5-graphicaleffects" "lingmoui"
)
makedepends=("extra-cmake-modules")
pkgdesc="Terminal emulator using LingmoUI as interface style on LingmoOS."
pkgrel=2
pkgver=2.0.0
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c32a7677d1ea88048ef27a50485d2271d0a4150136bdb77e999d368fda8b701a')

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
