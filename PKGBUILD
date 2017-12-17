# Maintainer: David Adler <d dot adler aet posteo dot de>

pkgname=yoshimi
pkgver=1.5.6
pkgrel=1
pkgdesc="a fork of the ZynAddSubFX software systhesizer"
arch=('i686' 'x86_64')
url="http://yoshimi.sourceforge.net/"
license=('GPL')
depends=('jack' 'fltk' 'fftw' 'mxml' 'cairo' 'lv2')
makedepends=('cmake' 'mesa')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yoshimi/$pkgname/archive/$pkgver.tar.gz")
md5sums=('1259f0054e8848208c7db62d462c155f')

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
