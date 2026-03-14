# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=htscodecs
pkgver=1.6.6
pkgrel=1
pkgdesc="Custom compression for sequencing formats, e.g. CRAM"
arch=('x86_64')
url=https://github.com/samtools/htscodecs
license=('BSD-3-Clause')
depends=('bzip2' 'zlib')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/htscodecs-$pkgver.tar.gz)
sha256sums=('67aa800f671f1489f7f9e45de09e7248177ccd3bcea0be14b85ff15f40d45eea')

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
