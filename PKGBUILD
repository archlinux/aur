
pkgname=gneural_network
pkgver=0.5.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="GNU package which implements a programmable neural network"
depends=('glibc')
# makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
license=('GPL')
url="http://www.gnu.org/software/gneuralnetwork/"
source=("gneural_network-${pkgver}.tar.gz::http://cvs.savannah.gnu.org/viewvc/*checkout*/gneuralnetwork/gneural_network-${pkgver}.tar.gz?revision=1.1&root=gneuralnetwork")
sha1sums=('f63552b5f157838e430b7b48bdc7a39ede4354c0')

prepare()
{
  cd "$srcdir/gneural_network-${pkgver}"
  autoreconf -vfi
}

build()
{
  cd "$srcdir/gneural_network-${pkgver}"
  ./configure --prefix=/usr
}

package()
{
  cd "$srcdir/gneural_network-${pkgver}"
  make install DESTDIR="$pkgdir"
}
