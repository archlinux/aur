# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=ntpclient
pkgver=2015.365
pkgrel=1
pkgdesc='A simple NTP (RFC-1305) client'
url='http://doolittle.icarus.com/ntpclient/'
arch=(x86_64 i686)
depends=(glibc)
license=(GPL2)
source=(http://doolittle.icarus.com/ntpclient/ntpclient_${pkgver/./_}.tar.gz)
sha1sums=('7513df5b5b64797c5fac27d7c1161f53a4675b26')

build() {
  cd ntpclient-${pkgver%.*}
  make
}

package() {
  cd ntpclient-${pkgver%.*}
  install -D -m755 ntpclient $pkgdir/usr/bin/ntpclient
}
