# Contributors:
#   Alexander Ulrich <a.ulrich@student.uni-tuebingen.de>
#   Mildred <silkensedai@online.fr>
#   henning mueller <henning@orgizm.net>
#   Stefan J. Betz <info@stefan-betz.net>

pkgname=libowfat
pkgver=0.29
pkgrel=3
pkgdesc='GPL reimplementation of libdjb'
arch=(i686 x86_64)
url=http://www.fefe.de/libowfat/
makedepends=(dietlibc)
license=(GPL)
install=libowfat.install
conflicts=(tinycdb)
options=(staticlibs)
source=(
  http://dl.fefe.de/$pkgname-$pkgver.tar.bz2
)
sha256sums=(
  4badbdeed6bef4337f1edd6b86fb7154c5592509c272dcdc09c693161cbc6427
)

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
