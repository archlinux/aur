# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp
pkgver=5.7
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.com/ukopp"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.com/uploads/1/3/0/3/13035936/${pkgname}-${pkgver}.tar.gz")
md5sums=('026a259dade72a5872935185dfa71a3e')
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
