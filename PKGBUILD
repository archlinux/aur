# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=windecor
pkgname=wayfire-plugins-windecor
pkgver=0.8.0
pkgrel=3
pkgdesc="A window decoration plugin for wayfire - a more sophisticated alternative to the inbuilt decoration plugin"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire' 'librsvg')
makedepends=('meson' 'ninja' 'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('f055d263b55eb8250fc25aa72fcbdd68')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

