# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=htscodecs
pkgver=1.6.4
pkgrel=1
pkgdesc="Custom compression for sequencing formats, e.g. CRAM"
arch=('x86_64')
url=https://github.com/samtools/htscodecs
license=('BSD-3-Clause')
depends=('bzip2' 'zlib')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/htscodecs-$pkgver.tar.gz)
sha256sums=('8dad8bea5ddd9bbc90f434bfad046faa950fa7a337641952a73bdebe63932ae5')

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
