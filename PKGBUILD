# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contributor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=mbt
pkgver=3.2.12
pkgrel=1
pkgdesc="Memory-based tagger-generator and tagger in one."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils' 'timbl' 'timblserver')
makedepends=('libtool')
options=(!libtool)
url="http://ilk.uvt.nl/mbt"
source=("http://software.ticc.uvt.nl/$pkgname-$pkgver.tar.gz")
md5sums=('9b1af47c2c79c6f4f2d19f9ae98c2825')

build() {
  cd $srcdir/$pkgname-$pkgver
 
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

