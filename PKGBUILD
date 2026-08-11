# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=xcpc
pkgver=0.53.0
pkgrel=1
epoch=1
pkgdesc="An Amstrad CPC emulator"
arch=('i686' 'x86_64')
url="http://www.xcpc-emulator.net/"
license=('GPL')
depends=('gtk3')
optdepends=()
source=(https://github.com/ponceto/xcpc-emulator/releases/download/xcpc-$pkgver/xcpc-$pkgver.tar.gz)
sha256sums=('d1d86ad1b894758744e431c09cb37c53def7a5655e220f625f3d8d02a25931a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


