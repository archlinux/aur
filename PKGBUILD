# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=libccp4
pkgver=6.4.6
pkgrel=2
pkgdesc="Protein X-ray crystallography toolkit - Libraries"
arch=('i686' 'x86_64')
url="http://www.ccp4.ac.uk/"
license=('GPL')
provides=(ccp4-libs)
replaces=(ccp4-libs5)
conflicts=('ccp4-libs5')
depends=('mmdb2')
makedepends=('gcc-fortran')
source=(ftp://ftp.ccp4.ac.uk/opensource/$pkgname-$pkgver.tar.gz)
sha256sums=('a51b59c101bd94385408ffd070ec77fcefe43c519e7d6f7ad88d6b204935b8fa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix=/usr --enable-shared --datadir=/usr/share/ccp4 --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"  

  make DESTDIR="$pkgdir/" install
} 
