# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-settings
arch=("x86_64")
depends=(
    "qt5-base" "qt5-quickcontrols2" "qt5-x11extras" "freetype2"
    "fontconfig" "networkmanager-qt" "modemmanager-qt5" "libqtxdg"
    "lingmoui"
)
makedepends=("extra-cmake-modules")
pkgdesc="The system settings application for LingmoOS uses LingmoUI as the interface style."
pkgrel=1
pkgver=2.1.7
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('db5e1d9c660703e0593e50e6ea556bbf474cce167ebae0f263f9c3107268059d')

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
