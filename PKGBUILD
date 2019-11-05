# Maintainer: Mathias Buhr <napcode@apparatus..de>

pkgname=sonic-lineup
pkgver=1.0
pkgrel=1
pkgdesc="Sonic Lineup is a free, open-source application for Windows, Linux, and Mac, designed for rapid visualisation of multiple audio files containing versions of the same source material"
arch=('x86_64')
url="https://www.sonicvisualiser.org/sonic-lineup/"
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
source=("${pkgname}-${pkgver}.tar.gz::https://code.soundsoftware.ac.uk/attachments/download/2581/${pkgname}-${pkgver}.tar.gz")
sha1sums=('ac37f1b0cfcd25c6b9e1f9c7e42a5c64da1b3677')

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
