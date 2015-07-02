# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=milena-basewords
pkgver=0.2.10
pkgrel=1
pkgdesc="Milena is a Polish speech synthesizer for Linux (basewords)"
arch=(any)
url="http://milena.polip.com/"
license=('GPL')
source=(http://tts.polip.com/files/$pkgname-$pkgver.tar.gz
        makefile.patch)
sha256sums=('73125fe8446becd83974f442e8f95048e2c635d23dea7b5efbf3cd09ea501eb6'
            'b08e6909bb51003d37fdd5598d1ff4657edae4feec35ad74f588263f7456a435')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np0 < "$srcdir/makefile.patch"
  #work normaly, you stupid.. :< :x
#  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
