# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=gnuastro
pkgver=0.9
pkgrel=1
pkgdesc='Various programs and library functions for the manipulation and analysis of astronomical data'
arch=('x86_64')
license=('GPL3')
depends=('gsl' 'cfitsio' 'wcslib' 'libgit2' 'ghostscript' 'libtiff' 'libtool' 'libjpeg')
url='https://www.gnu.org/software/gnuastro/'
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('126ce3f3610a83208dbbfd6ef36342fa')

prepare() {
  cd $pkgname-$pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --sysconfdir=/etc
}

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
