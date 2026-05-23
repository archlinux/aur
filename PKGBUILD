# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-wallpaper-effects
pkgname=plasma6-applets-wallpaper-effects
pkgver=2.1.1
pkgrel=1
pkgdesc="Plasma Widget to enable Active Blur and other cool effects for all wallpaper plugins"
arch=('any')
url="https://github.com/luisbocanegra/plasma-wallpaper-effects"
license=('GPL-3.0-or-later')
depends=('libplasma')
makedepends=('gcc' 'extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('2b92f71a869db3325d4d112b50c1fad3ed28fcaf5e7981e78f34c147162b19d2')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
