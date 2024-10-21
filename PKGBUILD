# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmoui
arch=("x86_64")
depends=("qt5-quickcontrols2" "qt5-x11extras" "kwindowsystem5")
makedepends=("extra-cmake-modules")
pkgdesc="A GUI library based on QQC2 (Qt Quick Controls 2), every Lingmo application uses it."
pkgrel=1
pkgver=2.2.1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('28a09d252f00f8f5f8e948ca2bc1f6e0dfc97776bc0cb7d28916590a64cc3e1f')

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
