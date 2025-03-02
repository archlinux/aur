# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-sddm-theme
arch=("x86_64")
depends=("sddm")
makedepends=("extra-cmake-modules")
pkgdesc="SDDM theme for LingmoOS"
pkgrel=1
pkgver=2.7.0
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ddd7f97ac3be1de534ea479d3a2ac61bf64e9ff773baebd774dd51c8faea08f9')

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
