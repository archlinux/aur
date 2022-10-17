# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=Lock
pkgname=desq-utils-lock
pkgver=0.0.7
pkgrel=1
pkgdesc="Screen Locker for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesq' 'pam' 'dfl-wayqt' 'dfl-settings')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('4e2c113217427877c50c5f47798661b8')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
