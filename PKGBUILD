# Contributor: Orivej Desh <orivej@gmx.fr>
# Contributor: Benjamin van der Burgh <benjaminvdb@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=epstool
pkgver=3.08
pkgrel=4
pkgdesc="Utility to create or extract preview images in EPS files, fix bounding boxes and convert to bitmaps"
arch=('i686' 'x86_64')
url="http://pages.cs.wisc.edu/~ghost/gsview/epstool.htm"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/e/epstool/${pkgname}_${pkgver}+repack.orig.tar.gz" "gcc43.patch")
md5sums=('465a57a598dbef411f4ecbfbd7d4c8d7'
         '7fdf8e6ecd866c8804a7ca4359a16459')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ../gcc43.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="${pkgdir}" EPSTOOL_ROOT=/usr install
}

