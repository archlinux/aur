# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Maintainer: Adrien Sohier <adrien.sohier@art-software.fr>

pkgname=paulstretch-jack
pkgver=2.2
pkgrel=2
pkgdesc='a program for stretching the audio suitable only for extreme sound stretching of the audio  and for applying special effects by spectral smoothing the sounds.'
arch=('i686' 'x86_64')
url="http://hypermammut.sourceforge.net/paulstretch/"
license=('GPL')
depends=('fltk' 'fftw' 'jack' 'audiofile' 'libmad' 'mxml' 'portaudio')
source=("http://sourceforge.net/projects/hypermammut/files/paulstretch/${pkgver}/paulstretch-${pkgver}.tar.bz2")

build() {
  cd "$srcdir/paulstretch-$pkgver"

  sed -i "s@-lvorbisenc@-lvorbis -logg -lz &@" compile_linux_fftw_jack.sh
  ./compile_linux_fftw_jack.sh
}

package() {
  cd "$srcdir/paulstretch-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  cp paulstretch "$pkgdir/usr/bin/"
}

md5sums=('da39e1ff45dde9634fb54d7818037215')
