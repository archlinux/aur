# Maintainer: Mathias Buhr <napcode@apparatus.de>

pkgname=sonic-lineup
pkgver=1.1
pkgrel=1
pkgdesc="Sonic Lineup is a free, open-source application for Windows, Linux, and Mac, designed for rapid visualisation of multiple audio files containing versions of the same source material"
arch=('x86_64')
url="https://www.sonicvisualiser.org/sonic-lineup/"
license=('GPL2')
depends=(
  'capnproto'
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
  'qt5-svg'
  'qt5-tools'
  'rubberband'
  'serd'
  'sord'
)
makedepends=(
  'boost'
)
source=("${pkgname}-${pkgver}.tar.gz::https://code.soundsoftware.ac.uk/attachments/download/2765/${pkgname}-${pkgver}.tar.gz")
sha256sums=('30e1c5f6f17827ebc03b8c7526e6a9481ecedf05a017e07dd1a432ae5c9a854c')

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
