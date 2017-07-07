# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=lives
pkgver=2.8.7
pkgrel=1
pkgdesc="A Video Editing System"
arch=('i686' 'x86_64')
url="http://lives-video.com"
license=('GPL')
depends=('mplayer' 'imagemagick' 'gtk3' 'sox' 'libvisual' 'mjpegtools' 'python' 'ffmpeg2.8' 'jack' 'fftw')
optdepends=('sdl' 'libogg' 'mkvtoolnix-cli' 'libmatroska' 'ogmtools' 'libavc1394' 'dvgrab' 'cdrkit' 'lame' 'youtube-dl' 'opencv')
makedepends=('pkg-config')
options=(!emptydirs)
changelog=lives.changelog
source=(http://lives-video.com/releases/LiVES-$pkgver.tar.bz2)
md5sums=('cc7cb094fda687c17b6bf3e64dbafb1b')

build() {
  cd ${pkgname}-${pkgver}
  PKG_CONFIG_PATH=/usr/lib/ffmpeg2.8/pkgconfig\
    ./configure --prefix=/usr --enable-turbo --disable-doxygen
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
