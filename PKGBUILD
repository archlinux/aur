# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=1.2
pkgrel=1
epoch=1
_commit=43c6e49b8e567b1c3a4c89a05b59d7bddb98b401
pkgdesc="A frontend for Doom engines"
arch=('x86_64')
url="https://gitlab.com/sdcofer70/enyo-doom"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom' 'prboom-plus' 'gzdoom')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/sdcofer70/enyo-doom/repository/$pkgver/archive.tar.bz2")
sha512sums=('bcd56ef26d2b639b251e90d580d4a4fc39e0591faa22750117c9123b0c76e049116b21b935fd5352d715e7a219236b31bd416ee9e5b4a1c4be59d1daac335b88')

build() {
  cmake -B build -S $pkgname-$pkgver-$_commit \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
