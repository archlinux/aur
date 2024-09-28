# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-sddm-theme
arch=("x86_64")
depends=("sddm")
makedepends=("extra-cmake-modules")
pkgdesc="SDDM theme for LingmoOS"
pkgrel=1
pkgver=2.0.1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('22a30c52a6b0145fadf559d7b71d7f371b2fe343e007d43a3144ab6ce233a85a')

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
