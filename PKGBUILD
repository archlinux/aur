# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-panel-colorizer
pkgname=plasma6-applets-panel-colorizer
pkgver=0.5.1
pkgrel=1
pkgdesc="Fully-featured Plasma 6 widget that brings Latte-Dock and WM status bar customization features to default panels"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace')
makedepends=('extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('d0f8d3c53e25253bf40d4bf60e940661cecc0ffa9a50efe79b171d0624d02482')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
