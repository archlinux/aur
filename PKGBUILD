# Maintainer: jgmdev <jgmdev@gmail.com>

_pkgname=wayfire-scale-ipc
_pkgver=ac7926ddaa322c24d595ab5e4ef94b3eb3b382d7
pkgname=wayfire-plugins-scale-ipc
pkgver=0.0.1
pkgrel=3
pkgdesc="Extra IPC interaction for the scale plugin of Wayfire."
arch=('x86_64' 'aarch64')
url="https://github.com/dkondor/${_pkgname}"
license=('MIT')
depends=('wayfire' 'nlohmann-json')
makedepends=('meson' 'ninja')
source=("https://github.com/dkondor/${_pkgname}/archive/${_pkgver}.zip")
md5sums=('30bee5e9ed841e6e52283992af99fc3d')

build() {
  cd "${_pkgname}-${_pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-${_pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
