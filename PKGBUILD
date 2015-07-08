# Maintainer: DOOMer <doomer3d@gmail.com>
# Contributor: DOOMer <doomer3d@gmail.com>
pkgname=screengrab
pkgver=1.2.1
pkgrel=1
pkgdesc="Crossplatform tool for grabbing screenshots of your desktop."
arch=('i686' 'x86_64')
url="http://screengrab.doomer.org/"
license=('GPL2')
depends=('qt4>=4.6.0')
makedepends=('cmake>=2.6')
source=(screengrab-$pkgver.tar.gz::http://screengrab.doomer.org/download/screengrab-1_2_1_/)
md5sums=('b233b108558c509419bd754ba1c2c318')

build() {
echo "build"
cd $srcdir/screengrab-$pkgver
mkdir build
cd build
cmake "$srcdir/$_gitname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
make || return 1
} 

package() {
cd $srcdir/screengrab-$pkgver
cd build
make DESTDIR="${pkgdir}" install || return 1
}