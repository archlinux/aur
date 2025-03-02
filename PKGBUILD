# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmoui
arch=("x86_64")
depends=("qt5-quickcontrols2" "qt5-x11extras" "kwindowsystem5")
makedepends=("extra-cmake-modules")
pkgdesc="A GUI library based on QQC2 (Qt Quick Controls 2), every Lingmo application uses it."
pkgrel=1
pkgver=2.3.0
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('26ca96015ca7b2bd98d8024e48ea924f557d16b8a687d7e3c827ba50b6cbfb57')

prepare() {
    cd "${srcdir}/LingmoUI-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/LingmoUI-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}                                                                                                        
package() {
    cd LingmoUI-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
