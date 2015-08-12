#Contributor: Panagiotis Papadopoulos pano_90 AT gmx DOT net 
pkgname=libbs2b
pkgver=3.1.0
pkgrel=2
pkgdesc="Bauer stereophonic-to-binaural DSP effect library"
arch=('i686' 'x86_64')
url=http://bs2b.sourceforge.net
license=('GPL')
depends=()
makedepends=()
source=(http://downloads.sourceforge.net/bs2b/$pkgname-$pkgver.tar.gz)
md5sums=('2c3351f1785364107aabc44f67d33d84')

build() {

cd $srcdir/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1

}

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR=$pkgdir install  || return 1
}