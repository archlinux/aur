# Maintainer: jgmdev <jgmdev@gmail.com>

_pkgname=wayfire-scale-ipc
_pkgver=e452019d6d2ad3b4b4daaa647a057394f8d42b2f
pkgname=wayfire-plugins-scale-ipc
pkgver=0.0.1
pkgrel=2
pkgdesc="Extra IPC interaction for the scale plugin of Wayfire."
arch=('x86_64' 'aarch64')
url="https://github.com/dkondor/${_pkgname}"
license=('MIT')
depends=('wayfire' 'nlohmann-json')
makedepends=('meson' 'ninja')
source=("https://github.com/dkondor/${_pkgname}/archive/${_pkgver}.zip")
md5sums=('b8c7e0dc481043e960041dff43d76a42')

build() {
  cd "${_pkgname}-${_pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-${_pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
