# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=lives
pkgver=2.6.3
pkgrel=2
pkgdesc="A Video Editing System"
arch=('i686' 'x86_64')
url="http://lives-video.com"
license=('GPL')
depends=('mplayer' 'imagemagick' 'gtk3' 'sox' 'libvisual' 'liboil' 'libavc1394' 'mjpegtools' 'python' 'ffmpeg2.8' 'jack' 'fftw')
optdepends=('xorg-utils' 'sdl' 'libogg' 'mkvtoolnix-cli' 'libmatroska' 'ogmtools' 'dvgrab' 'cdrkit' 'lame' 'youtube-dl')
options=(!emptydirs)
changelog=lives.changelog
source=(http://lives-video.com/releases/LiVES-$pkgver.tar.bz2)
md5sums=('b5fad0838b180902f8304b1978bbac41')

build() {
  cd $pkgname-$pkgver
  PKG_CONFIG_PATH=/usr/lib/ffmpeg2.8/pkgconfig\
    ./configure --prefix=/usr --enable-turbo
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
