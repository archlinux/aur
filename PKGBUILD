# Maintainer: Marcel Schneider <marcel@coopmasters.de>
pkgname=xlslib  
pkgver=2.5.0
pkgrel=1 
pkgdesc="A C/C++ multi-platform library for dynamically generating Excel(TM) files"
url="http://xlslib.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=($pkgname-package-$pkgver.zip::http://sourceforge.net/projects/$pkgname/files/$pkgname-package-$pkgver.zip/download)
md5sums=('567336ebee41552195c4035c87b9361b')
build() {
  cd $srcdir/$pkgname/$pkgname
  /bin/sh ./bootstrap
  LIBS=-lstdc++ ./configure --prefix=/usr
  make
}
package() {
	cd $srcdir/$pkgname/$pkgname
  make DESTDIR=$pkgdir install
}

