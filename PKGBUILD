# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-screenshots
arch=("x86_64")
depends=("qt5-quickcontrols2" "qt5-tools")
makedepends=("extra-cmake-modules")
pkgdesc="Screenshot tool for LingmoOS."
pkgrel=1
pkgver=1.9.9
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('752792ed7ca476608ee1b505a4cb2c4bc8349b7e5c0a1207ac6455cc71d71b5e')

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
