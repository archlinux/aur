# Contributors:
#   Alexander Ulrich <a.ulrich@student.uni-tuebingen.de>
#   Mildred <silkensedai@online.fr>
#   henning mueller <henning@orgizm.net>
#   Stefan J. Betz <info@stefan-betz.net>

pkgname=libowfat
pkgver=0.32
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

sha256sums=('f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1'
            'SKIP')
