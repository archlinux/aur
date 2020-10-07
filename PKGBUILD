# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=2.0.2
pkgrel=1
epoch=1
_commit=c7dc1ecec2458a201716cac8074a4025e2db36f3
pkgdesc="A frontend for Doom engines"
arch=('x86_64')
url="https://gitlab.com/sdcofer70/enyo-doom"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom' 'prboom-plus' 'gzdoom')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/sdcofer70/enyo-doom/repository/$pkgver/archive.tar.bz2")
sha512sums=('01ba67eb7704f408b45e2603778df6244872e972e0fb8c6c1b9da6e4dc52cb41d294179b02abc79d50cbd2f9abd3f7dde46613261259ead24705e1364fcea174')

build() {
  cmake -B build -S $pkgname-$pkgver-$_commit \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
