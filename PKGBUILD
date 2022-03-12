# Contributor: Bitts311 <oceanmail311@gmail.com>

##Select your language - all bg cs da de el en es fr hu it ja ko mk nb nl pl ro ru sk sv tr uk pt_BR zh_CN zh_TW

pkgname=mplayer-gui
pkgver=1.5
pkgrel=2
pkgdesc='Media player for Linux - latest stable release'
url='http://www.mplayerhq.hu/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'ttf-font' 'enca' 'libxss' 'a52dec' 'libvpx' 'lirc' 'x264' 'libmng' 'libdca' 'aalib' 'libxinerama' 'smbclient' 'libmad' 'libcaca' 'libxxf86vm' 'faac' 'faad2' 'libxv' 'libxvmc' 'mpg123' 'libx11' 'libcdio' 'libcdio-paranoia' 'rtmpdump' 'libdvdread' 'libdvdnav' 'ffmpeg' 'libbs2b' 'alsa-lib' 'giflib' 'glibc' 'libass' 'zlib' 'libjpeg' 'libpng' 'libpulse' 'libogg' 'fribidi' 'libtheora' 'libvorbis' 'libbluray' 'xvidcore' 'ncurses' 'fontconfig' 'freetype2' 'libxext' 'libvdpau' 'libgl' 'openal' 'speex' 'libmpeg2' 'glibc' 'lame' 'libxxf86vm' 'libmad' 'libxinerama' 'libmng' 'libxss' 'aalib' 'libcaca' 'libxv' 'libxvmc' 'ladspa' 'libcdio' 'zlib' 'libcdio-paranoia' 'libdvdcss' 'libdvdread' 'libdvdnav' 'giflib' 'libbs2b' 'opus' 'libvorbis' 'libpulse' 'alsa-lib' 'glibc' 'libass' 'libjpeg' 'libpng' 'libogg' 'libtheora' 'libbluray' 'xvidcore' 'libx11' 'smbclient' 'lirc' 'unzip' 'mesa' 'live-media' 'git' 'mpg123' 'rtmpdump' 'fribidi' 'gsm' 
)

makedepends=('xorgproto' 'cmake' 'yasm')

conflicts=('mplayer' 'mencoder')
provides=('mplayer' 'mencoder')
install=mplayer-gui.install
options=('!emptydirs')
source=("http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.5.tar.xz"
"https://mplayerhq.hu/MPlayer/skins/Blue-1.13.tar.bz2"
)
sha512sums=('SKIP' 'SKIP')

build() {
  cd "MPlayer-1.5"
  ./configure --prefix=/usr --enable-runtime-cpudetection --enable-gui  --disable-vidix --enable-gl --language=all --language-msg=all
  make
}

package() {
  cd "MPlayer-1.5"
  make DESTDIR="$pkgdir" install
  mv $srcdir/Blue $pkgdir/usr/share/mplayer/skins/default
}

