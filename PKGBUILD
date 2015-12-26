# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xmedcon  
pkgver=0.14.0
pkgrel=1
pkgdesc="open source toolkit for medical image conversion"
url="http://xmedcon.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/project/$pkgname/XMedCon-Source/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('653facf7b6ea9a0db9040191db50014f')
options=('!libtool')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --libdir=/usr/lib
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
