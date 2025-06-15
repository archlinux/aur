# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-cursor-eyes
pkgname=plasma6-applets-cursor-eyes
pkgver=0.2.0
pkgrel=1
pkgdesc="Rolling eyes that follow your mouse pointer, a port of xeyes as a widget for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/$_gitname"
license=('GPL3')
depends=('plasma-workspace')
makedepends=('extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('140541e48839896b5b71b57323f254ceba7eae7edd60d2fcbecfdf391e9a61c4')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
