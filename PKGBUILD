# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-wallpaper-effects
pkgname=plasma6-applets-wallpaper-effects
pkgver=2.0.0
pkgrel=1
pkgdesc="Plasma Widget to enable Active Blur and other cool effects for all wallpaper plugins"
arch=('any')
url="https://github.com/luisbocanegra/plasma-wallpaper-effects"
license=('GPL-3.0-or-later')
depends=('libplasma')
makedepends=('gcc' 'extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('549db7e12c17eec0f79e3ffae48d9a7408adf55fa9c4dc97afba429288bff9aa')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
