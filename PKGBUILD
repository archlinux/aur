# Contributor: Roberto Alsina <ralsina@kde.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=eel-language
pkgver=0.3.6
pkgrel=4
pkgdesc="A scripting and programming language"
arch=('i686' 'x86_64')
url="http://www.olofson.net"
license=('LGPL')
depends=('bash')
source=("http://eelang.org/download/EEL-$pkgver.tar.bz2")
md5sums=('03a1ebefd68bd5c8bcb545a87f1b886e')
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
