# Maintainer: Maarten van Gompel <proycon at anaproy.nl>

pkgname=ticcutils
pkgver=0.7
pkgrel=2
pkgdesc="Common library with functions for tools developed at Tilburg Centre for Cognition and Communication"
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/"
license=('GPL')
depends=('gcc-libs' 'libxml2' 'bzip2' 'libtar' 'boost')
makedepends=('libtool' 'autoconf')
options=(!libtool)
source=(http://software.ticc.uvt.nl/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('812370bce2b4cefb48b16ec863e70825')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

