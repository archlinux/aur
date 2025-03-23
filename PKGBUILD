# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-wallpapers
arch=("x86_64")
depends=()
makedepends=("extra-cmake-modules")
pkgdesc="Built-in wallpapers for LingmoOS."
pkgrel=1
pkgver=3.0.0_rc1
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('32d6478cb365158aa96d79eff150e5f39c3ff66366b2177cecc84b63aae7a3d8')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}
package() {
    cd ${pkgname}-${pkgver//_/-}/build
    make DESTDIR="${pkgdir}" install
}

