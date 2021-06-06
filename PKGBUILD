# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Wittfella <wittfella@wittfella.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qtfm
pkgver=6.2.1
pkgrel=1
pkgdesc="A lightweight file manager"
arch=('i686' 'x86_64')
url="https://github.com/rodlie/qtfm/releases"
license=('GPL')
depends=('qt5-base' 'desktop-file-utils' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rodlie/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b9c707443e20644f6e5f0393ce5158843724ac08f92cf8d7ea8e1109957b5c00')

build() {
  cd $pkgname-${pkgver//_/-}
  [[ -d build ]] || mkdir build
  cd build
  qmake CONFIG+=release PREFIX=/usr ..
  make
}

package() {
  cd $pkgname-${pkgver//_/-}/build
  make INSTALL_ROOT="$pkgdir" install
}
