# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=peg-e
pkgver=1.2.8
pkgrel=1
pkgdesc='Peg elimination game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('06d6a07c056b82372cdd6ac258dbfedab397ad4f13b70117f548b8218201ff17')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
