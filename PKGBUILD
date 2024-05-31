# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-panel-spacer-extended
pkgname=plasma6-applets-panel-spacer-extended
pkgver=1.8.2
pkgrel=1
pkgdesc="Mouse gestures for the KDE Plasma Panel, drag window, run any shortcut, command, application with configurable mouse actions!"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace' 'kdeplasma-addons')
makedepends=('extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('d5e9b56cd4720b65ebca552e416165807da59f6c3484c0e5b6bb74d2301ad41f')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
