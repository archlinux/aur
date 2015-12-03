# Maintainer: M0Rf30

pkgname=ndpi-git
pkgver=261.6f3d5a7
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
replaces=('ndpi')
conflicts=('ndpi')
source=('ndpi::git+https://github.com/ntop/nDPI.git')
makedepends=('git')

pkgver() {
  cd ndpi
  echo $(git rev-list --count dev).$(git rev-parse --short dev)
}

build() {
  cd ndpi
  ./autogen.sh
  ./configure --prefix=/usr
  make
}
         
package() {
  cd ndpi
  make DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
