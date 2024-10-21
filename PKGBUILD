# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-dock
arch=("x86_64")
depends=(
    "kwindowsystem5" "qt5-quickcontrols2" "qt5-x11extras" "qt5-tools"
    "lingmoui"
)
makedepends=("extra-cmake-modules")
pkgdesc="The dock component of LingmoOS, which relies on LingmoUI."
pkgrel=1
pkgver=2.0.3
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9fa03a701698dde9b916ec9d422426dada6c759041d37cc86c7a06ffc1f8a1d7')

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
