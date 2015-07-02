# Maintainer: jpate <jkpate@jkpate.net>
pkgname=praat
pkgver=5.4.10
pkgrel=1
pkgdesc="A tool for 'Doing Phonetics by computer'"
arch=('x86_64' 'i686')
url="http://www.fon.hum.uva.nl/praat/"
license=('GPL')
depends=( 'alsa-lib' 'gtk2' )
makedepends=( 'pkg-config' )
optdepends=( 'ttf-sil-fonts' )
source=("http://www.fon.hum.uva.nl/praat/praat5410_sources.tar.gz")
md5sums=('a3b965f7597eefc0273488a6497221b8')

prepare() {
  cd "$srcdir/sources_5410/"

  cp makefiles/makefile.defs.linux.alsa makefile.defs
}

build() {
  cd "$srcdir/sources_5410/"

  make
}

package() {
  cd "$srcdir/sources_5410/"

  install -Dm755  praat "$pkgdir/usr/bin/praat"
}

