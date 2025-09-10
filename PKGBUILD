# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-cursor-eyes
pkgname=plasma6-applets-cursor-eyes
pkgver=0.2.2
pkgrel=1
pkgdesc="Rolling eyes that follow your mouse pointer, a port of xeyes as a widget for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace')
makedepends=('extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('b07e73ef86713da71dec2bd03ed810fd09739fb4e3760d48f1222dee85665979')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
