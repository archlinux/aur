# Maintainer: Roland Suchan <snrd at arcor dot de>
# Contributor: Emanuele Rossi <newdna1510 at yahoo dot it>

pkgname=qdvdauthor
pkgver=2.3.1
pkgrel=10
pkgdesc="QDVDAuthor is a GUI frontend for dvdauthor, video DVD creator"
url="https://sourceforge.net/projects/qdvd"
license=('GPL2')
arch=('i586' 'x86_64')
depends=('qt5-base' 'ffmpeg063-static' 'vlc' 'xine-lib')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=()
provides=(
  qdvdauthor.desktop
  qdvdauthor.png
  CHANGELOG
  COPYING
  README
  TODO
  audio_streams.html
  system_register.html
  silence.ac3
  silence.mp2
  dvd-slideshow
  libjhead.so
  background00000.jpg
  qdvdauthor
  qslideshow
  qrender
)
options=()
source=(https://sourceforge.net/projects/qdvd/files/qdvd-2.3.1-qt5/qdvdauthor-${pkgver}-010a.tar.gz)
md5sums=('10adc7ca9018333a9bb11224873f70e9')

build() {
  cd qdvdauthor-${pkgver}/build
  
  cmake ../. -DCMAKE_INSTALL_PREFIX=/usr 
  make clean 
  make "-j$(nproc)" || return 1
}
 
package() {
  cd qdvdauthor-${pkgver}/build
  
  make DESTDIR="$pkgdir" install
}
