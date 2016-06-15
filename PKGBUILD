# Maintainer: David Adler <d dot adler aet posteo dot de>

pkgname=yoshimi
pkgver=1.4.0
pkgrel=1
pkgdesc="a fork of the ZynAddSubFX software systhesizer"
arch=('i686' 'x86_64')
url="http://yoshimi.sourceforge.net/"
license=('GPL')
depends=('jack' 'fltk' 'fftw' 'mxml' 'cairo' 'lv2')
makedepends=('cmake' 'boost' 'mesa')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yoshimi/$pkgname/archive/$pkgver.tar.gz")
md5sums=('e3b9bb883d24ac34ac4e677cc63a87ec')
sha256sums=('362931a693eedeb4800b8c2be091a9d9235d9d5fbbe9102d9d730c80aa919f97')

build() {
  cd "$srcdir/$pkgname-$pkgver/src" 
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_INSTALL_DATAROOTDIR="$pkgdir/usr/share" \
    -DCMAKE_INSTALL_LIBDIR="$pkgdir/usr/lib" .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src" 
  make install
}

# vim:set ts=2 sw=2 et:
