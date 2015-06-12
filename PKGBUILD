# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributer: Mark Rosenstand <mark@borkware.net>

pkgname=interbench
pkgver=0.31
pkgrel=4
pkgdesc="Emulates and measures CPU scheduling latency and jitter"
url="http://users.on.net/~ckolivas/interbench/"
license=('GPLv2')
arch=('i686' 'x86_64')
depends=('glibc')
options=(!strip)
md5sums=('832254d7fd1255c548ebea7b97f01015')
source=("http://ck.kolivas.org/apps/interbench/$pkgname-$pkgver.tar.bz2")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make clean
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 interbench "$pkgdir/usr/bin/interbench"
  install -Dm644 interbench.8 "$pkgdir/usr/share/man/man8/interbench.8"
  install -Dm644 readme "$pkgdir/usr/share/doc/interbench/readme"
  install -Dm644 readme.interactivity "$pkgdir/usr/share/doc/interbench/readme.interactivity"
}
