pkgname=spral
pkgver=2023.03.29
pkgrel=1
pkgdesc="Sparse Parallel Robust Algorithms Library"
arch=('x86_64')
url="https://github.com/ralna/spral"
license=('BSD')
makedepends=('make')
depends=('metis' 'lapack' 'hwloc')
source=("https://github.com/ralna/spral/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0bcf1c1839f36e48e5435769ea757f2c0f45e7632edd612ca95edc8c4fa73afa')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr 
  make -j1
}

package ()
{
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
