# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=settings
pkgname=dfl-settings
pkgver=0.1.0alpha2
pkgrel=1
pkgdesc="A class that extends QSettings"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha2/-alpha2}/${_pkgname}-v${pkgver/alpha2/-alpha2}.tar.gz")
md5sums=('fd4de558c1c896732c598f856d78a3e4')

build() {
  cd "${_pkgname}-v${pkgver/alpha2/-alpha2}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha2/-alpha2}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
