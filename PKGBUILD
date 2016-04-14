# Maintainer: SeeLook <seelook@gmail.com>
pkgname=nootka
pkgver=1.2.5
pkgrel=2
pkgdesc="A crossplatform tool for learning classical score notation. Mostly for guitarists but also very good for ear training."
arch=('x86_64' 'i686')
url="http://nootka.sourceforge.net/"
license=('GPL3')
groups=()
depends=('qt5-base' 'fftw' 'shared-mime-info' 'libvorbis' 'soundtouch')
optdepends=(
'libpulse: for PulseAudio' 
'qt5-translations: for other languages support'
)
conflicts=('nootka-hg')
makedepends=('cmake' 'qt5-base' 'fftw' 'libvorbis' 'soundtouch')
install="${pkgname}.install"
source=("http://sourceforge.net/projects/nootka/files/Nootka-$pkgver/nootka-$pkgver-source.tar.bz2")
md5sums=('358104f3453c67d3027677e13e22a733')
 
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
