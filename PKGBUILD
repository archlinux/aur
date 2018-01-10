# Maintainer: metamer <metamer at openmailbox dot org>
# Contributors: Saurav Modak <srvmdk at gmail dot com>
pkgname=iok
pkgver=2.1.3
pkgrel=1
pkgdesc="onscreen keyboard for indic scripts"
arch=('x86_64' 'i686')
url="https://releases.pagure.org/iok"
license=('GPL')
depends=( 'libunique3')
source=("$url/$pkgname-$pkgver.tar.gz")
md5sums=('88ed68410e1b8c218cc576bf5b81b1a1')
install='.INSTALL'
changelog='.Changelog'
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
