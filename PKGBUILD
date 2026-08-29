# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=miru-zoom
_pkgname=miru
pkgver=0.7.0
pkgrel=1
pkgdesc="A Wayland-based zoom daemon and control utility"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Vaishnav-Sabari-Girish/miru"
license=('MIT')
depends=('wayland' 'mesa' 'libffi')
makedepends=('cmake' 'ninja' 'pkgconf' 'wayland-protocols')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4a7411a56b45bf41d02e753c1238f02524734bf791dc871bbf4ed1a5c4c9c578')

build() {
  cmake -B build -S "${_pkgname}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cmake --install build --prefix "${pkgdir}/usr"
}
