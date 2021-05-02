# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=xcpc
pkgver=0.37.0
pkgrel=1
epoch=1
pkgdesc="An Amstrad CPC emulator"
arch=('i686' 'x86_64')
url="http://www.xcpc-emulator.net/doku.php/index"
license=('GPL')
depends=('gtk3')
optdepends=()
source=(https://bitbucket.org/ponceto/xcpc/downloads/xcpc-$pkgver.tar.gz)
sha256sums=('798fbeea00ef7772a28e2cd6fa4d6690c0edac7dbbb97778e3b883b962d386a4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


