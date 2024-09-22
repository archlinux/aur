# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-systemicons
arch=("x86_64")
depends=()
makedepends=("extra-cmake-modules")
conflicts=("cutefish-icons")
pkgdesc="Default icon theme for Lingmo."
pkgrel=1
pkgver=2.0.4
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a54094c292b318530cd6ce846e02d22592b4a575ef0d5c72522a94df3e7be24c')

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

