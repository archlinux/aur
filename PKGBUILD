# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=2.0.0
pkgrel=1
epoch=1
_commit=02c44ff19dac548ffdc9628e1b768651a6f9b42b
pkgdesc="A frontend for Doom engines"
arch=('x86_64')
url="https://gitlab.com/sdcofer70/enyo-doom"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom' 'prboom-plus' 'gzdoom')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/sdcofer70/enyo-doom/repository/$pkgver/archive.tar.bz2")
sha512sums=('c0c47886c901b8dfe32d5c2771449b8ee4f56f1d87d956e500c40cecd78f089b6b3aeec205be16abf15e3be64e719985d872ef2a8d64fb1442165a0162d872ac')

build() {
  cmake -B build -S $pkgname-$pkgver-$_commit \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
