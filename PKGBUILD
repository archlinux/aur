# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=htscodecs
pkgver=1.6.7
pkgrel=1
pkgdesc="Custom compression for sequencing formats, e.g. CRAM"
arch=('x86_64')
url=https://github.com/samtools/htscodecs
license=('BSD-3-Clause')
depends=('bzip2' 'zlib')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/htscodecs-$pkgver.tar.gz)
sha256sums=('5100e4b27646a27042a00b07cada35ce9fa3c7fc5aacd0de9874cd5d16c35fbf')

build() {
  cd $pkgname-$pkgver
  aclocal
  autoreconf --install
  ./configure --prefix=/usr
  make CFLAGS=-g
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
