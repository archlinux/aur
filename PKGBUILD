# Maintainer: Beej <beej@beej.us>
# Contributor: DOOMer <doomer3d@gmail.com>
pkgname=screengrab
pkgver=1.2.1
pkgrel=3
pkgdesc="Crossplatform tool for grabbing screenshots of your desktop."
arch=('i686' 'x86_64')
url="http://screengrab.doomer.org/"
license=('GPL2')
depends=('qt4>=4.6.0')
makedepends=('cmake>=2.6')
source=(screengrab-$pkgver.tar.gz::https://github.com/DOOMer/screengrab/archive/${pkgver}.tar.gz)
sha256sums=('48cdaf66e6eff3ef0db89cb09b7c5757f07b99dd1cd05321e33b04a14c670d3b')

build() {
  echo "build"
  cd $srcdir/screengrab-$pkgver
  mkdir build
  cd build
  cmake "$srcdir/$_gitname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
  make
} 

package() {
  cd $srcdir/screengrab-$pkgver
  cd build
  make DESTDIR="${pkgdir}" install
}
