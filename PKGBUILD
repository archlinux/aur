# Maintainer: David Adler <d dot adler aet posteo dot de>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=yoshimi
pkgver=1.3.8
pkgrel=1
pkgdesc="a fork of the ZynAddSubFX software systhesizer"
arch=('i686' 'x86_64')
url="http://yoshimi.sourceforge.net/"
license=('GPL')
depends=('jack' 'fltk' 'fftw' 'mxml' 'cairo' 'lv2')
makedepends=('cmake' 'boost' 'mesa')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yoshimi/$pkgname/archive/$pkgver.tar.gz")
md5sums=('6ff53b3ebfa237378f618533554fb7b8')
sha256sums=('ceea1cebd2c6b024426d22a0a090964056a32058a5d17201d2e9076533285865')

build() {
  cd "$srcdir/$pkgname-$pkgver/src" 
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_INSTALL_DATAROOTDIR="$pkgdir/usr/share" \
    -DCMAKE_INSTALL_LIBDIR="/lib" .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src" 
  make install
}

# vim:set ts=2 sw=2 et:
