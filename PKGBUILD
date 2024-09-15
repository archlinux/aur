# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=xcpc
pkgver=0.52.1
pkgrel=1
epoch=1
pkgdesc="An Amstrad CPC emulator"
arch=('i686' 'x86_64')
url="http://www.xcpc-emulator.net/"
license=('GPL')
depends=('gtk3')
optdepends=()
source=(https://bitbucket.org/ponceto/xcpc/downloads/xcpc-$pkgver.tar.gz)
sha256sums=('0dcc1079e55b3cadf051b9621d983e6b00c1a21d98b6afd692311eb116ffb1a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


