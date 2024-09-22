# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-videoplayer
arch=("x86_64")
depends=("mpv" "qt5-base" "qt5-quickcontrols2" "qt5-tools")
makedepends=("extra-cmake-modules")
pkgdesc="Open source video player built using Qt/QML and libmpv."
pkgrel=1
pkgver=2.0.0
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2afd37a4b35d834e7b0749009e65cb639e9f163219ee742e63f2cac3b5d590e9')

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
