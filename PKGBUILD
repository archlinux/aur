# Maintainer: Mathias Buhr <napcode@apparatus..de>

pkgname=tony
pkgver=2.1
pkgrel=1
pkgdesc="Tony: a tool for melody transcription"
arch=('x86_64')
url="https://www.sonicvisualiser.org/tony/"
license=('GPL2')
depends=(
  'fftw'
  'jack2'
  'libfishsound'
  'libid3tag'
  'liblo'
  'liblrdf'
  'libmad'
  'liboggz'
  'libpulse'
  'libsamplerate'
  'libsndfile'
  'libx11'
  'opus'
  'portaudio'
  'qt5-base'
  'qt5-base'
  'qt5-tools'
  'rubberband'
  'serd'
  'sord'
)
makedepends=(
  'gcc'
  'make'
)
source=("${pkgname}-${pkgver}.tar.gz::https://code.soundsoftware.ac.uk/attachments/download/2582/${pkgname}-${pkgver}.tar.gz")
sha1sums=('9806e845a332915eb7b2b80742665e0de75991f2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export INSTALL_ROOT="${pkgdir}/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export INSTALL_ROOT="${pkgdir}/"
  make install
}
