# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=liblingmo
arch=("x86_64")
depends=(
    "qt5-quickcontrols2" "networkmanager-qt5" "modemmanager-qt5" "bluez-qt5"
    "libkscreen5" "kio5" "qt5-sensors"
)
makedepends=("extra-cmake-modules")
pkgdesc="System library for Lingmo applications"
pkgrel=1
pkgver=1.9.10
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/lib_lingmo/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('be89a707f5aaae86bd4e59b0784f82414d380ce530d974d4e1fb62c42c4a4106')

prepare() {
    cd "${srcdir}/lib_lingmo-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/lib_lingmo-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd lib_lingmo-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
