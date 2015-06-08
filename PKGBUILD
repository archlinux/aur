# Contributor: Roberto Alsina <ralsina@kde.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=eel-language
pkgver=0.3.6
pkgrel=3
pkgdesc="A scripting and programming language"
arch=('i686' 'x86_64')
url="http://www.olofson.net"
license=('LGPL')
depends=('bash')
source=("http://eel.olofson.net/download/EEL-$pkgver.tar.bz2")
md5sums=('586c39c4abe41dc88f1317d586bad26c')
options=('!libtool' 'staticlibs')

build() {
  cd $srcdir/EEL-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/EEL-$pkgver
  make DESTDIR=$pkgdir install
}
