# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=2.0.1
pkgrel=1
epoch=1
_commit=c363fcdea29e1f739c51fc3403bf448a64bbd20a
pkgdesc="A frontend for Doom engines"
arch=('x86_64')
url="https://gitlab.com/sdcofer70/enyo-doom"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom' 'prboom-plus' 'gzdoom')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/sdcofer70/enyo-doom/repository/$pkgver/archive.tar.bz2")
sha512sums=('7e2d0ce108417796e4129c46b51250a7b01d267252035d6efc2a56bdc0f7305e72e5eea9253a4da510f91992e9de5cdd749e0870a9b66a5929963b2ff4347f35')

build() {
  cmake -B build -S $pkgname-$pkgver-$_commit \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
