# Contributor: Otakar Truněček <otakar.trunecek@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=vcp
pkgver=2.2
pkgrel=5
pkgdesc="Visual cp: a cp program with some scrollbars"
url="http://www.freebsdsoftware.org/sysutils/vcp.html"
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('ncurses')
backup=(etc/vcp.conf)
source=(http://members.iinet.net.au/~lynx/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('90a47777e6fcf364e2e1fd12e8b67d69')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 -o root -g root vcp $pkgdir/usr/bin/vcp
  install -D -m 644 -o root -g root vcp.1.gz \
    $pkgdir/usr/share/man/man1/vcp.1.gz
  install -D -m 644 -o root -g root vcp.pl.1.gz \
    $pkgdir/usr/share/man/pl/man1/vcp.1.gz
  install -D -m 644 -o root -g root vcp.conf.sample \
    $pkgdir/etc/vcp.conf
  install -D -m 644 COPYRIGHT \
    $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}
