# Maintainer: lily wilson <hotaru@thinkindifferent.net>
pkgname=libemf
pkgver=1.0.8
pkgrel=0
pkgdesc="ECMA-234 Metafile Library"
arch=('i686' 'x86_64')
url="http://libemf.sourceforge.net/"
license=('LGPL2')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ee0324f705136a4d3343c2f0c3e5fa526fae0ec3680a96400d5fd209c60a3891')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
