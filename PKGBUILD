# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-texteditor
arch=("x86_64")
depends=("qt5-base" "qt5-quickcontrols" "qt5-tools" "syntax-highlighting5")
makedepends=("extra-cmake-modules")
pkgdesc="An easy-to-use and aesthetically pleasing text editor for Lingmo OS."
pkgrel=1
pkgver=2.0.1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('defb08cf3a2182511cbb8cdb23c110543b5ce6fbd73e1aa667739057d4d12371')

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
