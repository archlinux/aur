# Contributor: Chee Sing Lee <cslee (funny 'a' symbol) eia.udg.edu>
# Maintainer: Sean Greenslade <aur AT seangreenslade.com>
pkgname=cvblob
pkgver=0.10.4
pkgrel=3
pkgdesc="A computer vision library to detect connected regions in binary digital images."
arch=('i686' 'x86_64')
url="https://github.com/harshjv/cvblob"
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
source=('git+https://github.com/harshjv/cvblob#tag=0.10.4')
noextract=()
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
