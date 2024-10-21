# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-screenshots
arch=("x86_64")
depends=("qt5-quickcontrols2" "qt5-tools")
makedepends=("extra-cmake-modules")
pkgdesc="Screenshot tool for LingmoOS."
pkgrel=1
pkgver=2.0.0
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('caf3593f9db3b3551aef8339bd3edfc146be466b62907e16c085afa950986962')

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
