# Maintainer: Maarten van Gompel <proycon at anaproy.nl>
# Contributor: Bjorn Arild Maeland <bjorn.maeland at gmail dot com>

pkgname=timbl
pkgver=6.4.6
pkgrel=2
pkgdesc="Tilburg Memory-Based Learner, implementations of k-nearest neighbour classification "
arch=('i686' 'x86_64')
url="http://ilk.uvt.nl/timbl/"
license=('GPL')
depends=('gcc-libs' 'libxml2' 'ticcutils')
makedepends=('libtool' 'autoconf')
install=timbl.install
options=(!libtool)
source=(http://software.ticc.uvt.nl/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('5c71abd9fa793f0adfa096ef065bf1c2')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
