# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=xcpc
pkgver=0.36.0
pkgrel=1
epoch=1
pkgdesc="An Amstrad CPC emulator"
arch=('i686' 'x86_64')
url="http://www.xcpc-emulator.net/doku.php/index"
license=('GPL')
depends=('gtk3')
optdepends=()
source=(https://bitbucket.org/ponceto/xcpc/downloads/xcpc-$pkgver.tar.gz)
sha256sums=('e7ac1765d4d4a832e43ea597d6508425fcb5a5484ddb84be6872d914fb114d29')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


