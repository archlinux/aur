# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=dnsperf
pkgver=1.0.1.0
pkgrel=1
pkgdesc="Tools that measure performance of authoritative Domain Name services"
arch=('i686' 'x86_64')
url="http://www.nominum.com/resources/measurement-tools"
license=('GPL')
depends=('bind')
source=("ftp://ftp.nominum.com/pub/nominum/dnsperf/$pkgver/dnsperf-src-$pkgver-1.tar.gz")
sha256sums=('2876529516e3600d903e850c81f76adf7a7bec9969a20afa6d08f0f671f27893')

build() {
  cd "$srcdir/$pkgname-src-$pkgver-1"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-src-$pkgver-1"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
