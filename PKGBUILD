# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-filemanager
arch=("x86_64")
depends=("qt5-quickcontrols2" "kwindowsystem5" "kio5")
makedepends=("extra-cmake-modules")
pkgdesc="A file manager that simple to use, beautiful, and retain the classic PC interactive design used by LingmoOS."
pkgrel=1
pkgver=0.8
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e685f2ca83ac31b0227cf3480e925542fa026beeee057a77c375f8d89f0d8047')

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
