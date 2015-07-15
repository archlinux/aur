# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: damir <damir@archlinux.org>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=jpegpixi
pkgver=1.1.1
pkgrel=3
pkgdesc="A program to interpolate pixels in JPEG images"
arch=('i686' 'x86_64')
url="http://www.zero-based.org/software/jpegpixi/"
license=('GPL2')
depends=('libjpeg' 'glibc')
#source=(http://www.zero-based.org/software/$pkgname/$pkgname-$pkgver.tar.gz)
source=(https://dl.dropboxusercontent.com/u/29095940/oss/jpegpixi-1.1.1.tar.gz)
md5sums=('c888abdb58ff63d634215d4d5b160d5d')

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
