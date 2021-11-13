# Maintainer: SeeLook <seelook@gmail.com>
pkgname=metronomek
pkgver=0.5.0
_pkgver=0.5.0
pkgrel=2
pkgdesc="Metronome that works and sounds similar to mechanical devices but with all goods of computer program."
arch=('x86_64' 'i686')
url="https://metronomek.sourceforge.io/"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'shared-mime-info')
optdepends=(
'libpulse: for PulseAudio'
'alsa-lib: for ALSA'
)
makedepends=('cmake' 'qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2')
source=("https://sourceforge.net/projects/metronomek/files/Metronomek-$_pkgver/metronomek-$_pkgver-source.tar.bz2")
sha256sums=('3cb1754ee1f7377e946f64bf920b21b9ba93c3dea4a7845d70b5b6de70638a6a')

build() {
  cd "$srcdir/metronomek-$_pkgver-source"
  mkdir "$srcdir/metronomek-$_pkgver-source/build"
  cd "$srcdir/metronomek-$_pkgver-source/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "$srcdir/metronomek-$_pkgver-source/build"
  make DESTDIR="$pkgdir/" install
} 
