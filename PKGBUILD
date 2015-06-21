# Past contributors: Roman Kyrylych <Roman.Kyrylych@gmail.com>, pukyxd
# Current contributor: Nagy Gabor <Gabor.V.Nagy@@gmail.com>

pkgname=xerces-c-2
pkgver=2.8.0
pkgrel=5
pkgdesc="A validating XML parser written in a portable subset of C++." 
arch=('i686' 'x86_64')
url="http://xerces.apache.org/xerces-c"
license=("APACHE")
depends=('gcc-libs')
options=('!makeflags')
source=("http://apache.mirrors.crysys.hit.bme.hu/xerces/c/2/sources/xerces-c-src_2_8_0.tar.gz")
md5sums=('5daf514b73f3e0de9e3fce704387c0d2')
conflicts=('xerces-c')

build() { 
  export XERCESCROOT=$srcdir/xerces-c-src_2_8_0
  cd $srcdir/xerces-c-src_2_8_0/src/xercesc
  ./runConfigure -plinux -cgcc -xg++ -minmem -nsocket -tnative -rpthread -P/usr
  make
}

package() {
cd $srcdir/xerces-c-src_2_8_0/src/xercesc
make DESTDIR=$pkgdir install
} 