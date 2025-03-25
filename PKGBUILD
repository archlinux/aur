# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-wallpaper-effects
pkgname=plasma6-applets-wallpaper-effects
pkgver=0.4.3
pkgrel=1
pkgdesc="Plasma Widget to enable Active Blur and other cool effects for all wallpaper plugins"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace')
makedepends=('extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('b6b4e0a0e8ac0afb5d6568d741b920ca5d6b9289e0158c3e9cfe843508e953d5')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
