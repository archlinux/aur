# Maintainer: SeeLook <seelook@gmail.com>
pkgname=nootka
pkgver=1.9.0.rc1
_pkgver=1.9.0-rc1
pkgrel=1
pkgdesc="A cross-platform tool for learning classical score notation. Sight reding and ear training."
arch=('x86_64' 'i686')
url="https://nootka.sourceforge.io/"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'fftw' 'shared-mime-info' 'libvorbis' 'soundtouch' 'alsa-lib')
optdepends=(
'libpulse: for PulseAudio'
'jack: for JACK'
'qt5-translations: for other languages support'
)
conflicts=('nootka-hg')
makedepends=('cmake' 'qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'fftw' 'libvorbis' 'soundtouch' 'alsa-lib')
source=("https://sourceforge.net/projects/nootka/files/Nootka-$_pkgver/nootka-$_pkgver-source.tar.bz2")
md5sums=('e046c168a0f9219c6033bd1a139f1fe4')

build() {
  cd "$srcdir/nootka-$_pkgver-source"
  mkdir "$srcdir/nootka-$_pkgver-source/build"
  cd "$srcdir/nootka-$_pkgver-source/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "$srcdir/nootka-$_pkgver-source/build"
  make DESTDIR="$pkgdir/" install
} 
