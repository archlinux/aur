# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: damir <damir@archlinux.org>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=jpegpixi
pkgver=1.1.1
pkgrel=4
pkgdesc="A program to interpolate pixels in JPEG images"
arch=('i686' 'x86_64')
url="http://www.zero-based.org/software/jpegpixi/"
license=('GPL2')
depends=('libjpeg' 'glibc')
#source=(http://www.zero-based.org/software/$pkgname/$pkgname-$pkgver.tar.gz)
source=("https://github.com/jose1711/jpegpixi/archive/1.1.1.tar.gz")
md5sums=('65aa1aa91cc57dffdc33ee410f51fb14')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}


package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
