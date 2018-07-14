# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=1.05
pkgrel=2
_commit=3e3cc1a4798a8732935b23697b7037a431819726
pkgdesc="A frontend for Doom engines"
arch=('x86_64')
url="https://gitlab.com/sdcofer70/enyo-doom"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom' 'prboom-plus' 'gzdoom')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/sdcofer70/enyo-doom/repository/$pkgver/archive.tar.bz2")
sha256sums=('c8f18daf02ab6aa53055f147fcd35fc0f34727a2bcfd8233613a3f0a63c29a90')

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
