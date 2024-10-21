# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-gtk-themes
arch=("x86_64")
depends=()
makedepends=("extra-cmake-modules")
pkgdesc="GTK themes for Lingmo OS"
pkgrel=1
pkgver=2.0.1

url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('019f3783b34141495fe87975356bc967731606442b59ba2628e41ddfcd75b4fd')

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