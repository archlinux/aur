# Maintainer: lukem570 <https://github.com/lukem570>
pkgname=kmodel
pkgver=0.1.0
pkgrel=1
pkgdesc='KDE-native 3D model viewer with Vulkan rendering'
arch=('x86_64')
url='https://github.com/lukem570/kModel'
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-quickcontrols2'
    'kirigami'
    'vulkan-icd-loader'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qt6-shadertools'
    'vulkan-headers'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "kModel-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
