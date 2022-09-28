# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=volume
pkgname=dfl-volume
pkgver=0.1.0alpha2
pkgrel=1
pkgdesc="Volume control to allow users to choose devices and control the volume"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'libpulse')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha2/-alpha2}/${_pkgname}-v${pkgver/alpha2/-alpha2}.tar.gz")
md5sums=('2c09a7deabfed87244807049eb76706c')

build() {
  cd "${_pkgname}-v${pkgver/alpha2/-alpha2}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha2/-alpha2}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
