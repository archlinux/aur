# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp
pkgver=5.8
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.com/ukopp"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('f2a4a083e60a080cdae4492fde7fc6f5')
options=('!emptydirs')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  export PREFIX=/usr
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make LDFLAGS="-lpthread" 
}
package() { 
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/applications
  make DESTDIR=$pkgdir install
}
