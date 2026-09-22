# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=miru-zoom
_pkgname=miru
pkgver=0.10.0
pkgrel=1
pkgdesc="A Wayland-based zoom daemon and control utility"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Vaishnav-Sabari-Girish/miru"
license=('MIT')
depends=('wayland' 'mesa' 'libffi')
makedepends=('cmake' 'ninja' 'pkgconf' 'wayland-protocols')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9f2cd923c3516eed7ad37688606013df20f54db2828f218a4db1463add877670')

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
