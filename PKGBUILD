# Maintainer: jgmdev <jgmdev@gmail.com>

_pkgname=wayfire-scale-ipc
_pkgver=395be618f8723e2639b3c40f8867bf5aadb8ee0e
pkgname=wayfire-plugins-scale-ipc
pkgver=0.0.1
pkgrel=1
pkgdesc="Extra IPC interaction for the scale plugin of Wayfire."
arch=('x86_64' 'aarch64')
url="https://github.com/dkondor/${_pkgname}"
license=('MIT')
depends=('wayfire')
makedepends=('meson' 'ninja')
source=("https://github.com/dkondor/${_pkgname}/archive/${_pkgver}.zip")
md5sums=('9e83d6eb5efecf49cceff05361427dbf')

build() {
  cd "${_pkgname}-${_pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-${_pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
