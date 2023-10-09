# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=focus-request
pkgname=wayfire-plugins-focus-request
pkgver=0.8.0.1
pkgrel=1
pkgdesc="The wayfire plugin provides a mechanism to grant focus to views that make a focus self-request (request-activate). To be used with gtk-shell and qt-shell plugins"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire')
makedepends=('meson' 'ninja' 'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('db0a721f86e9345b3ef50949fd90e773')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

