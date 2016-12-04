# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=1.03
pkgrel=1
_commit=ac7be6532b97b2b9a6da60032064b5fddf51ca48
pkgdesc="A frontend for Doom engines"
arch=('i686' 'x86_64')
url="https://gitlab.com/sdcofer70/enyo-doom"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom' 'prboom-plus')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/sdcofer70/enyo-doom/repository/archive.tar.gz?ref=$pkgver")
md5sums=('ea54bc6c8d46855aab16fe101bea7866')

build() {
  cd $pkgname-$pkgver-$_commit

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_QMAKE_EXECUTABLE=qmake-qt5
  make
}

package() {
  cd $pkgname-$pkgver-$_commit

  make DESTDIR="$pkgdir" install
}
