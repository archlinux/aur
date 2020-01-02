# Maintainer: Mathias Buhr <napcode@apparatus.de>

pkgname=sonic-lineup
pkgver=1.0.1
pkgrel=2
pkgdesc="Sonic Lineup is a free, open-source application for Windows, Linux, and Mac, designed for rapid visualisation of multiple audio files containing versions of the same source material"
arch=('x86_64')
url="https://www.sonicvisualiser.org/sonic-lineup/"
license=('GPL2')
depends=(
  'boost-libs'
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
  'opusfile'
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
  'boost'
)
source=("${pkgname}-${pkgver}.tar.gz::https://code.soundsoftware.ac.uk/attachments/download/2610/${pkgname}-${pkgver}.tar.gz")
sha1sums=('426bdc3a6e9f702659f0338b6e471c013d74128a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export INSTALL_ROOT="${pkgdir}/"
  ./configure --prefix=/usr
  patch -Np1 -i "../../${pkgname}-${pkgver}.patch"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export INSTALL_ROOT="${pkgdir}/"
  make install
}
