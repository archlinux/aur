# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=1.1.1
pkgrel=1
epoch=1
_commit=1e03a05799d0cecf708f34347b8c2aa79a42b170
pkgdesc="A frontend for Doom engines"
arch=('x86_64')
url="https://gitlab.com/sdcofer70/enyo-doom"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom' 'prboom-plus' 'gzdoom')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/sdcofer70/enyo-doom/repository/$pkgver/archive.tar.bz2")
sha512sums=('e85102a9fb81932b6d8a801a604432f57f26cdc38a2583b1bb1462d5c6d0d6ddbd4e3da3ef2a1a360110035629955e879eff272e12b3fec59b8fd7ddb488492e')

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
