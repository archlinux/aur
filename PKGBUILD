# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=libbobcat
pkgver=3.25.01
pkgrel=1
pkgdesc="Bobcat (Brokken's Own Base Classes And Templates) library"
arch=('i686' 'x86_64')
url="http://bobcat.sourceforge.net"
license=('GPL')
depends=('openssl' 'libx11')
makedepends=('icmake' 'openssl' 'libmilter' 'libx11' 'yodl')
optdepends=()
source=("http://downloads.sourceforge.net/project/bobcat/bobcat/${pkgver}/bobcat_${pkgver}.orig.tar.gz")
md5sums=('df15f4b981df4f423c408d31198d94c5')

build() {
  cd "$srcdir/bobcat-${pkgver}"
  CXXFLAGS="$CXXFLAGS --std=c++11 -pthread"
  LDFLAGS="$LDFLAGS -pthread"
  ./build libraries all
  ./build man
}

package() {
  cd "$srcdir/bobcat-${pkgver}"
  ./build install "$pkgdir" "$pkgdir"
}

