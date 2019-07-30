# Maintainer: Tong Chunli (tty2099@gmail.com) 

pkgname=galib
_pkgnm=GAlib
pkgver=2.4.7
_pkgver=247
pkgrel=1
pkgdesc="GAlib contains a set of C++ genetic algorithm objects. "
arch=('any')
url="http://lancet.mit.edu/ga"
license=('MIT')
depends=()
source=(http://lancet.mit.edu/ga/dist/galib247.tgz)
sha256sums=('ea76b66ce4db4db2ed86e20d6d3ff144abaf73e33620104246639d9b2a465329')

package(){
  cd "$srcdir/$pkgname$_pkgver"
  sed -i -e 's|-g -Wall|-Wall -fPIC -fpermissive -std=c++98 -O3|g' makevars
  sed -i -e "s|DESTDIR=.*|DESTDIR=${pkgdir}/usr|g" makevars
  mkdir -p ${pkgdir}/usr/{lib,include}
  make lib install
}
