# Maintainer: Pierre Carrier <pierre@gcarrier.fr>

pkgname=afuse
pkgver=0.4.1
pkgrel=2
pkgdesc='Automounting file system implemented in user-space using FUSE'
url=https://github.com/pcarrier/afuse/
license=(GPL2)
arch=(i686 x86_64)
depends=(fuse)
makedepends=(autoconf automake pkg-config m4 make gcc)
source=(https://github.com/pcarrier/afuse/archive/v${pkgver}.tar.gz)
md5sums=(827e70b219402fc01e599bd385d4a04b)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
