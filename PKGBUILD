# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Thomas Zervogiannis <tzervo@gmail.com>
# Contributor: Loui Chang <louipc dot ist at gmail company>
# Contributor: rabyte <rabyte__gmail>

pkgname=tintin
pkgver=2.02.31
pkgrel=1
pkgdesc="A console-based MUD client"
arch=('i686' 'x86_64' 'aarch64')
url="http://tintin.sourceforge.net/"
license=('GPL3')
depends=('zlib' 'pcre' 'gnutls')
options=('strip')
source=(https://github.com/scandum/tintin/releases/download/$pkgver/tintin-$pkgver.tar.gz)
sha512sums=('1d152c929cf4df3ed3b3b80c8c350fb5916c778e5860eda6f18f09e97ad94cb1e5ba9d0176354cf1a5ee96373533a6fa1b63bf92b40140c7658da39ef41ba74a')

build() {
  cd $srcdir/tt/src
  sh configure --prefix=/usr --enable-big5
  make

}

package() {
  cd $srcdir/tt/src
  install -m755 -D tt++ $pkgdir/usr/bin/tt++
  ln -sf tt++ $pkgdir/usr/bin/tintin

}
