# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=miru-zoom
_pkgname=miru
pkgver=0.8.0
pkgrel=1
pkgdesc="A Wayland-based zoom daemon and control utility"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Vaishnav-Sabari-Girish/miru"
license=('MIT')
depends=('wayland' 'mesa' 'libffi')
makedepends=('cmake' 'ninja' 'pkgconf' 'wayland-protocols')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4f2e8e00f9b4271c8c3d5fabf8f16204727ed1dc143d59889fab04dc9e110bd')

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
