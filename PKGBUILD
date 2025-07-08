# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=htscodecs
pkgver=1.6.3
pkgrel=1
pkgdesc="Custom compression for sequencing formats, e.g. CRAM"
arch=('x86_64')
url=https://github.com/samtools/htscodecs
license=('BSD-3-Clause')
depends=('bzip2' 'zlib')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/htscodecs-$pkgver.tar.gz)
sha256sums=('ace6ae54fcdf49ac82b362d1d8a333559e023b1bbb8adbd47e8caf7963c22527')

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
