# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=DesQDropDown
pkgname=desq-apps-dropdown
pkgver=0.0.7
pkgrel=1
pkgdesc="A Quake-style DropDown app capable of showing widgets for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQApps/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesqui' 'dfl-applications' 'dfl-settings' 'dfl-utils' 'dfl-xdg' 'dfl-wayqt')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQApps/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('5001025adac48159814624e72db6b4be')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
