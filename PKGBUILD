# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=ntpclient
pkgver=2024.132
pkgrel=1
pkgdesc='A simple NTP (RFC-1305) client'
url='http://doolittle.icarus.com/ntpclient/'
arch=(x86_64 i686)
depends=(glibc)
license=(GPL2)
source=(http://doolittle.icarus.com/ntpclient/ntpclient_${pkgver/./_}.tar.gz)
sha1sums=('5db02f613a3033709b3073d7e16cd04bf6e3ae46')

build() {
  cd ntpclient-${pkgver%.*}
  make ntpclient adjtimex
}

package() {
  cd ntpclient-${pkgver%.*}
  install -t $pkgdir/usr/bin -D -m755 ntpclient adjtimex
  install -t $pkgdir/usr/share/man/man1 -D -m644 ntpclient.1
}
