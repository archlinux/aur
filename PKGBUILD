# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-screenlocker
arch=("x86_64")
depends=(
    "qt5-base" "qt5-declarative" "qt5-x11extras" "dbus" 
    "libx11"
)
makedepends=("extra-cmake-modules")
pkgdesc="Screenlocker for LingmoOS."
pkgrel=1
pkgver=2.0.2

url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eab4ba6593ec273afcc1eb845d7789ba23951b1fc7478ef57426ecec57572699')

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