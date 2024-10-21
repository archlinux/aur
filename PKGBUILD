# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-videoplayer
arch=("x86_64")
depends=("mpv" "qt5-base" "qt5-quickcontrols2" "qt5-tools")
makedepends=("extra-cmake-modules")
pkgdesc="Open source video player built using Qt/QML and libmpv."
pkgrel=1
pkgver=2.0.1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a2eb05600896fe4ff0399a0e3dffe5a8f5ae91f7306261d399ec40aec5ff3c0e')

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
