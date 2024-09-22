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
pkgrel=1
pkgver=1.9.9
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eed57d86d3d299a3ff264f6a0fa0fe477468240465146ebe681757c8fd016a6c')

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
