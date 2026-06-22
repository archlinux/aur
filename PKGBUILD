# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-application-widget
pkgname=plasma6-applets-application-widget
pkgver=0.2.0
pkgrel=1
pkgdesc='Run applications as Plasma widgets'
arch=('any')
url='https://github.com/luisbocanegra/plasma-application-widget'
license=('GPL-3.0-only')
depends=('plasma-desktop' 'qt6-wayland')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n')
provides=('plasma-application-widget')
conflicts=('plasma-application-widget')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('77b3c38fd765cad0cb9ecccb91c4d3d9feaf093b9d13191ba2a88625dcd8cb4d')

build() {
    cd "${srcdir}/${_gitname}-$pkgver"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=None
    cmake --build build
}

package() {
    cd "${srcdir}/${_gitname}-$pkgver"
    DESTDIR="${pkgdir}" cmake --install build
}
