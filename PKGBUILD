# Maintainer: lily wilson <hotaru@thinkindifferent.net>
pkgname=libemf
pkgver=1.0.7
pkgrel=0
pkgdesc="ECMA-234 Metafile Library"
arch=('i686' 'x86_64')
url="http://libemf.sourceforge.net/"
license=('LGPL2')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/libEMF-${pkgver}.tar.gz")
sha256sums=('9f2fd8bb84e345978c7fc45a39e06fc6a44fee867a91ebe83433d3a34348fd21')

build() {
  cd $srcdir/libEMF-$pkgver
  ./configure --prefix=/usr/lib
  make || return 1
}

package() {
  cd $srcdir/libEMF-$pkgver
  make DESTDIR=$pkgdir install
}
