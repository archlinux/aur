# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=1.06
pkgrel=1
_commit=e1589cc4e62bbb949459179131dd042908274211
pkgdesc="A frontend for Doom engines"
arch=('x86_64')
url="https://gitlab.com/sdcofer70/enyo-doom"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom' 'prboom-plus' 'gzdoom')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/sdcofer70/enyo-doom/repository/$pkgver/archive.tar.bz2")
sha256sums=('26dda4b94a53b1d519efdf9810d93040581f884582a87539fcf5409c54bdd677')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver-$_commit \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
