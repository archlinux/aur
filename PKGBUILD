# $Id$
# Maintainer: Abi Hafshin <abi@hafs.in>

pkgname=kamus
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple Indonesia<=>English Dictionary"
arch=(i686 x86_64)
license=(GPL)
url="http://github.com/abiehaf/kamus"
depends=(hicolor-icon-theme gtk3 glib2 libgee)
makedepends=(vala gnome-common)
options=('!emptydirs')
source=(https://github.com/abiehaf/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('a3540be21202fcfa622d2d06ebc6d26f8643fe3e4752e11fd84825b5da403022')

prepare() {
  cd $pkgname-$pkgver
  
  #apply patch here

  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
