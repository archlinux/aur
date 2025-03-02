# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-gtk-themes
arch=("x86_64")
depends=()
makedepends=("extra-cmake-modules")
pkgdesc="GTK themes for Lingmo OS"
pkgrel=1
pkgver=2.0.2

url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4d46d12a314da55eeeee90170eb2a234cb2a18640f3e9d73dd4aa039a5909be7')

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