# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=phyml-beagle
pkgver=20141029
pkgrel=1
pkgdesc="Phylogenetic estimation using (Maximum) Likelihood"
arch=('i686' 'x86_64')
url="https://github.com/stephaneguindon/phyml/"
license=('GPL2')
depends=('beagle-lib')
source=("https://github.com/stephaneguindon/phyml-downloads/releases/download/development/phyml-$pkgver.tar.gz")
md5sums=('7d144bb5634f003a916297acc0fb4867')

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
