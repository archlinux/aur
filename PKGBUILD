# Contributor: Chee Sing Lee <cslee (funny 'a' symbol) eia.udg.edu>
# Maintainer: Sean Greenslade <aur AT seangreenslade.com>
pkgname=cvblob
pkgver=0.10.4
pkgrel=2
pkgdesc="A computer vision library to detect connected regions in binary digital images."
arch=('i686' 'x86_64')
url="http://code.google.com/p/cvblob/"
license=('LGPL')
groups=()
depends=('opencv')
makedepends=('cmake>=2.0.0')
optdepends=()
provides=(cvblob)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://cvblob.googlecode.com/files/$pkgname-$pkgver-src.tgz")
noextract=()
md5sums=('9d5e360c6de6fce36e95f5d64b67b9b1')

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
