# Maintainer: metamer <metamer at openmailbox dot org>
# Contributors: Saurav Modak <srvmdk at gmail dot com>
pkgname=iok
pkgver=2.1.0
pkgrel=1
pkgdesc="onscreen keyboard for indic scripts"
arch=('x86_64' 'i686')
url="https://fedorahosted.org/iok/"
license=('GPL')
depends=( 'libunique3')
source=("https://fedorahosted.org/releases/i/o/iok/$pkgname-$pkgver.tar.gz")
md5sums=('b30464d26da182c553a57b34c03a2c53')
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
