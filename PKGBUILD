# $Id$
# Contributor: Fabrizio Fresco < fabrizio . fresco at gmail . com >
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Yann Pomarede < yann . pomarede at gmail dot com >
# Contributor: tee < teeaur at duck dot com >

pkgname=brutefir
pkgver=1.1.0
pkgrel=1
pkgdesc="Is a software convolution engine, a program for applying long FIR filters to multi-channel digital audio, either offline or in realtime"
arch=('i686' 'x86_64' 'armv7h' )
#url="http://www.ludd.luth.se/~torger/brutefir.html"
url="https://torger.se/anders/brutefir.html"
license=('ISC')
depends=('fftw' 'alsa-lib' 'jack')
source=("https://torger.se/anders/files/$pkgname-$pkgver.tar.gz")
b2sums=('e11455c20f26efcd333e8ce415909c5f5a98bb616ce207563f44f03a2fc8fe0c9193594717da8dee09b1f1fc7e52575f65ffb02a7e48888b9efd4e0c51fe1e90')

build() {
  cd "${pkgname}-${pkgver}"
  sed 's@/usr/local@/usr@' -i Makefile
  make
}

package() {
  make -C "$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
