# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-wallpaper-effects
pkgname=plasma6-applets-wallpaper-effects
pkgver=0.6.0
pkgrel=1
pkgdesc="Plasma Widget to enable Active Blur and other cool effects for all wallpaper plugins"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace')
makedepends=('extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('aca5991d76a91bad7aa221b44f6c54a205d3936617d6750be2a48dad7c289377')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
