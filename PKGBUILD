# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=xcpc
pkgver=0.38.1
pkgrel=2
epoch=1
pkgdesc="An Amstrad CPC emulator"
arch=('i686' 'x86_64')
url="http://www.xcpc-emulator.net/"
license=('GPL')
depends=('gtk3')
optdepends=()
source=(https://bitbucket.org/ponceto/xcpc/downloads/xcpc-$pkgver.tar.gz)
sha256sums=('61ce3dbb6964d1796399087ec0aec23ca65d2d769caa06a222442c3ebf9cbeb8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


