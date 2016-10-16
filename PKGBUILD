# Contributors:
#   Alexander Ulrich <a.ulrich@student.uni-tuebingen.de>
#   Mildred <silkensedai@online.fr>
#   henning mueller <henning@orgizm.net>
#   Stefan J. Betz <info@stefan-betz.net>

pkgname=libowfat
pkgver=0.31
pkgrel=1
pkgdesc='GPL reimplementation of libdjb'
arch=(i686 x86_64)
url=http://www.fefe.de/libowfat/
makedepends=(dietlibc)
license=(GPL)
install=libowfat.install
conflicts=(tinycdb)
options=(staticlibs)
source=(
  http://www.fefe.de/$pkgname/$pkgname-$pkgver.tar.xz{,.sig}
)

validpgpkeys=('2DEC330151BB9F7DAD8B0BDCFC32CEECA534A9C6')

build() {
  cd $srcdir/$pkgname-$pkgver
  DIET= make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  DIET= make prefix=$pkgdir/usr/ LIBDIR=$pkgdir/usr/lib MAN3DIR=$pkgdir/usr/share/man/man3 install

  cd $pkgdir/usr/share/man/man3
  mv buffer.3 buffer-libowfat.3
}

sha256sums=('d1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12'
            'SKIP')
