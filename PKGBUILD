# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-panel-spacer-extended
pkgname=plasma6-applets-panel-spacer-extended
pkgver=1.11.1
pkgrel=1
pkgdesc="Mouse gestures for the KDE Plasma Panel, drag window, run any shortcut, command, application with configurable mouse actions!"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace' 'kdeplasma-addons')
makedepends=('extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('215587369bccdcbcc56668791371742984315823673630110a30eb6e7e968303')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
