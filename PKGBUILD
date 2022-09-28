# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=layouts
pkgname=dfl-layouts
pkgver=0.1.0alpha2
pkgrel=1
pkgdesc="Special layouts, ex, Dynamic Layout, Circular Layout etc"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha2/-alpha2}/${_pkgname}-v${pkgver/alpha2/-alpha2}.tar.gz")
md5sums=('c3040f625d8cf0b9e6338b67e2589f3d')

build() {
  cd "${_pkgname}-v${pkgver/alpha2/-alpha2}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha2/-alpha2}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
