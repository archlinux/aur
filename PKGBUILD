# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=focus-request
pkgname=wayfire-plugins-focus-request
pkgver=0.8.0.2
pkgrel=1
pkgdesc="The wayfire plugin provides a mechanism to grant focus to views that make a focus self-request (request-activate). To be used with gtk-shell and qt-shell plugins"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire')
makedepends=('meson' 'ninja' 'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('2e2b84218f03a9b46e87a90b3a2bf600')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

