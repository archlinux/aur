# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=yoshimi
pkgver=1.3.5
pkgrel=1
pkgdesc="ZynAddSubFX fork with improved JACK audio & MIDI IO"
arch=('i686' 'x86_64')
url="http://yoshimi.sourceforge.net/"
license=('GPL')
depends=('jack' 'fltk' 'fftw' 'mxml' 'cairo' 'lv2')
makedepends=('cmake' 'boost' 'mesa')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/1.3/$pkgname-$pkgver.tar.bz2")
md5sums=('e47f538cafba8579a0350c16aa086d8c')
sha256sums=('d90569375ac1ab829fea84622654452ff6382b0baef4de64e753ab5a477086ba')

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
