# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=phyml-beagle
pkgver=3.2.0
pkgrel=1
epoch=1
pkgdesc="Phylogenetic estimation using (Maximum) Likelihood"
arch=('i686' 'x86_64')
url="https://github.com/stephaneguindon/phyml/"
license=('GPL2')
depends=('beagle-lib')
source=("phyml-$pkgver.tar.gz::https://github.com/stephaneguindon/phyml/archive/v$pkgver.tar.gz")
md5sums=('4771c025431ed33ec7a3ba980df3b546')

prepare() {
  cd $srcdir/phyml-$pkgver

  chmod +x autogen.sh

  ./autogen.sh
}

build() {
  cd $srcdir/phyml-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-beagle

  make
}

package() {
  cd $srcdir/phyml-$pkgver

  make DESTDIR=$pkgdir install
}
