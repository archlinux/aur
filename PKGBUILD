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
pkgver=1.10.1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/lib_lingmo/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fd814f7d7094788876dfc12cacd10f6c41b2cb41a17b01463fe74eed65b96b70')

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
