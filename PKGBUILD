# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-systemicons
arch=("x86_64")
depends=()
makedepends=("extra-cmake-modules")
conflicts=("cutefish-icons")
pkgdesc="Default icon theme for Lingmo."
pkgrel=1
pkgver=2.0.5
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a3c93cc7970608a2eba7b5396d3fb6246fea3cfd5b5d74b3b452f4e4429d4af1')

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

