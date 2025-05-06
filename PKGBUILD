# Maintainer: jgmdev <jgmdev@gmail.com>

_pkgname=wayfire-scale-ipc
_pkgver=6fb75617ca52fd488160c7fd3a402798cd3c1e47
pkgname=wayfire-plugins-scale-ipc
pkgver=1.1.0
pkgrel=1
pkgdesc="Extra IPC interaction for the scale plugin of Wayfire."
arch=('x86_64' 'aarch64')
url="https://github.com/dkondor/${_pkgname}"
license=('MIT')
depends=('wayfire-git')
makedepends=('meson' 'ninja')
source=("https://github.com/dkondor/${_pkgname}/archive/${_pkgver}.zip")
md5sums=('9d15a2b9d40cf099ea5dc7e4b1bf7766')

build() {
  cd "${_pkgname}-${_pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-${_pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
