# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-wayqt -> dfl-gamma-effects

_pkgname=gamma-effects
pkgname=dfl-gamma-effects
pkgver=0.1.0alpha1
pkgrel=1
pkgdesc="A class to handle various display effects that can be performed using wlr-gamma-control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'dfl-wayqt')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha1/-alpha1}/${_pkgname}-v${pkgver/alpha1/-alpha1}.tar.gz")
md5sums=('0bd2b50e330f9b145911a38115fb9a27')

build() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
