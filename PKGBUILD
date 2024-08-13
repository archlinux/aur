# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=xcpc
pkgver=0.52.0
pkgrel=1
epoch=1
pkgdesc="An Amstrad CPC emulator"
arch=('i686' 'x86_64')
url="http://www.xcpc-emulator.net/"
license=('GPL')
depends=('gtk3')
optdepends=()
source=(https://bitbucket.org/ponceto/xcpc/downloads/xcpc-$pkgver.tar.gz)
sha256sums=('4bc8f2f24437a9e94bc507131eedcc406c608f27f01aeb9d79c1b8c0e7f9717f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


