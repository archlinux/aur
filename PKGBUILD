# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: libernux <dutchman55@gmx.com>
pkgname=wmsystemtray
pkgver=1.2
pkgrel=3
pkgdesc="system tray designed as a Window Maker dockapp"
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/355"
url="http://web.archive.org/web/20121031045149/http://dockapps.windowmaker.org/file.php/id/355"
license=('GPL')
depends=('libxmu' 'libxfixes' 'libxpm')
#source=("http://dockapps.windowmaker.org/download.php/id/814/$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz")
md5sums=('425b3cc8fc717a997a67706b8013ad21')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
  
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
