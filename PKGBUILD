# Maintainer: @AttilaBerenyiDr
pkgname=journal-gateway-gelf
pkgver=1.0.4
pkgrel=1
pkgdesc="A gateway for sending logs from systemd's journald over an HTTP connection to a Graylog server in GELF format."
arch=('i686' 'x86_64')
url="https://github.com/travelping/journal-gateway-gelf"
license=('LGPL')
depends=(jansson curl systemd)
source=(https://github.com/travelping/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('37e23f7bba8fc9003300687ee7499446')

build()
{ 
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package ()
{
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc
  mkdir -p $pkgdir/etc/systemd/system
  cd "$srcdir/$pkgname-$pkgver"
  cp journal-gateway-gelf $pkgdir/usr/bin
  cp misc/journal-gateway-gelf.service $pkgdir/etc/systemd/system/
  cp misc/journal-gateway-gelf.conf $pkgdir/etc
}

# vim:set ts=2 sw=2 et:
