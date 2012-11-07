# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=dnsperf
pkgver=2.0.0.0
pkgrel=1
pkgdesc="Tools that measure performance of authoritative Domain Name services"
arch=('i686' 'x86_64')
url="http://www.nominum.com/support/measurement-tools/"
license=('GPL')
depends=('bind')
source=("ftp://ftp.nominum.com/pub/nominum/dnsperf/$pkgver/dnsperf-src-$pkgver-1.tar.gz")
sha256sums=('23d486493f04554d11fca97552e860028f18c5ed6e35348e480a7448fa8cfaad')

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
