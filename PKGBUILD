# Maintainer: David Adler <d dot adler aet posteo dot de>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=yoshimi
pkgver=1.3.6
pkgrel=1
pkgdesc="ZynAddSubFX fork with improved JACK audio & MIDI IO"
arch=('i686' 'x86_64')
url="http://yoshimi.sourceforge.net/"
license=('GPL')
depends=('jack' 'fltk' 'fftw' 'mxml' 'cairo' 'lv2')
makedepends=('cmake' 'boost' 'mesa')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yoshimi/$pkgname/archive/$pkgver.tar.gz")
md5sums=('6c908a4161400f957effa0ae69c2c2fd')
sha256sums=('ff18a0318c9cf26992aabd36e63d1f98fed52b14b96c911d124e0baf66a7c372')

build() {
  cd "$srcdir/$pkgname-$pkgver/src" 
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_INSTALL_LIBDIR="/lib" .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src" 
  make install
}

# vim:set ts=2 sw=2 et:
