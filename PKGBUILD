# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=qt-shell
pkgname=wayfire-plugins-qtshell
pkgver=0.8.0.1
pkgrel=1
pkgdesc="Implementation of qt-shell protocol for Wayfire in the form of wayfire plugin"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire')
makedepends=('meson' 'ninja' 'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('7222f3368874f06e54b622e503764c21')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

