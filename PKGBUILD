# $Id$
# Maintainer: Sébastien "Seblu" Luttringer
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=gnuastro
pkgver=0.8
pkgrel=1
pkgdesc='Various programs and library functions for the manipulation and analysis of astronomical data'
arch=('x86_64')
license=('GPL3')
depends=('gsl' 'cfitsio' 'wcslib' 'libgit2' 'ghostscript')
url='https://www.gnu.org/software/gnuastro/'
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-latest.tar.gz")
md5sums=('1f9fe021bf153ac7291af95c95e2d716')

prepare() {
  cd $pkgname-$pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --sysconfdir=/etc \
      --enable-arithmetic \
      --enable-buildprog \
      --enable-convertt \
      --enable-convolve \
      --enable-cosmiccal \
      --enable-crop \
      --enable-fits \
      --enable-match \
      --enable-mkcatalog \
      --enable-mknoise \
      --enable-mkprof \
      --enable-noisechisel \
      --enable-segment \
      --enable-statistics \
      --enable-table \
      --enable-warp
}

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  #make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
