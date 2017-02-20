# Maintainer: SeeLook <seelook@gmail.com>
pkgname=nootka
pkgver=1.4.2
pkgrel=1
pkgdesc="A crossplatform tool for learning classical score notation. Mostly for guitarists but also very good for ear training."
arch=('x86_64' 'i686')
url="http://nootka.sourceforge.net/"
license=('GPL3')
groups=()
depends=('qt5-base' 'fftw' 'shared-mime-info' 'libvorbis' 'soundtouch' 'alsa-lib')
optdepends=(
'libpulse: for PulseAudio' 
'qt5-translations: for other languages support'
)
conflicts=('nootka-hg')
makedepends=('cmake' 'qt5-base' 'fftw' 'libvorbis' 'soundtouch' 'alsa-lib')
source=("http://sourceforge.net/projects/nootka/files/Nootka-$pkgver/nootka-$pkgver-source.tar.bz2")
md5sums=('d4ba7ad73b90583e2a1b0b7244955fcf')

build() {
  cd "$srcdir/nootka-$pkgver-source"
  mkdir "$srcdir/nootka-$pkgver-source/build"
  cd "$srcdir/nootka-$pkgver-source/build"
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "$srcdir/nootka-$pkgver-source/build"
  make DESTDIR="$pkgdir/" install
} 
