# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-wallpaper-effects
pkgname=plasma6-applets-wallpaper-effects
pkgver=0.1.1
pkgrel=1
pkgdesc="Plasma Widget to enable Active Blur and other cool effects for all wallpaper plugins"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace')
makedepends=('extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('4c888f29b92c150617dfcc0ec08dd7724c340a2c3b1aa99776612d62987da874')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
