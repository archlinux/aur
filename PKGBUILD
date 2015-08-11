# Maintainer: jpate <jkpate@jkpate.net>
pkgname=praat
pkgver=5.4.15
pkgrel=1
pkgdesc="A tool for 'Doing Phonetics by computer'"
arch=('x86_64' 'i686')
url="http://www.fon.hum.uva.nl/praat/"
license=('GPL')
depends=( 'alsa-lib' 'gtk2' )
makedepends=( 'pkg-config' )
optdepends=( 'ttf-sil-fonts' )
source=("http://www.fon.hum.uva.nl/praat/praat5415_sources.tar.gz")
# md5sums=('11171f2cacbd095122c9a53dcd629f9e')
md5sums=('11171f2cacbd095122c9a53dcd629f9e')

prepare() {
  cd "$srcdir/sources_5415/"

  cp makefiles/makefile.defs.linux.alsa makefile.defs

  sed -i '/setenv ("PULSE_LATENCY_MSEC"/d' sys/praat.cpp
}

build() {
  cd "$srcdir/sources_5415/"

  make
}

package() {
  cd "$srcdir/sources_5415/"

  install -Dm755  praat "$pkgdir/usr/bin/praat"
}

