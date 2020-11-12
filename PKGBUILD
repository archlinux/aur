# Maintainer: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=lives
pkgver=3.2.0
pkgrel=2
pkgdesc="A Video Editing System"
arch=('i686' 'x86_64')
url="http://lives-video.com"
license=('GPL')
depends=('libtirpc' 'mplayer' 'imagemagick' 'gtk3' 'sox' 'libvisual' 'mjpegtools' 'python' 'ffmpeg' 'jack2' 'fftw' 'glu' 'schroedinger')
optdepends=('sdl' 'libogg' 'mkvtoolnix-cli' 'libmatroska' 'ogmtools' 'libavc1394' 'dvgrab' 'cdrkit' 'lame' 'youtube-dl' 'opencv')
makedepends=('pkg-config')
options=(!emptydirs)
changelog=lives.changelog
source=(http://lives-video.com/releases/LiVES-$pkgver.tar.bz2)
md5sums=('5d7bd0ad41d3189b62c002e518fb94c8')

build() {
  cd ${pkgname}-${pkgver}

  CPPFLAGS+=" -I/usr/include/tirpc/"
  LDFLAGS+=" -ltirpc"

  ./configure --prefix=/usr --enable-turbo --disable-doxygen
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
