pkgname=libmixmod
pkgver=3.2.0
pkgrel=1
pkgdesc="Model-Based Unsupervised and Supervised Classification"
arch=('i686' 'x86_64')
url="http://www.mixmod.org"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://www.mixmod.org/IMG/tgz/libmixmod_${pkgver}_src.tgz")
sha1sums=('4524771551ff21eff2a75d4a45ffc5a61852cae3')

build () {
  cd "$srcdir"/libmixmod_${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr . 
  make
}

package () {
  cd "$srcdir"/libmixmod_${pkgver}
  make install DESTDIR="$pkgdir"
}
