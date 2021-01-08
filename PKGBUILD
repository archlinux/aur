# Contributor: Bitts311 <oceanmail311@gmail.com>

##Select your language - all bg cs da de el en es fr hu it ja ko mk nb nl pl ro ru sk sv tr uk pt_BR zh_CN zh_TW

pkgname=mplayer-gui
pkgver=1.4
pkgrel=3
pkgdesc='Media player for Linux - latest stable release'
url='http://www.mplayerhq.hu/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'ttf-font' 'enca' 'libxss' 'a52dec' 'libvpx' 'lirc' 'x264' 'libmng' 'libdca' 'aalib' 'libxinerama' 'smbclient' 'jack2' 'libmad' 'libcaca' 'libxxf86vm' 'faac' 'faad2' 'libxv' 'libxvmc' 'mpg123' 'libx11' 'libcdio' 'libcdio-paranoia' 'rtmpdump' 'libdvdread' 'libdvdnav' 'ffmpeg' 'libbs2b' 'alsa-lib' 'giflib' 'glibc' 'libass' 'zlib' 'libjpeg' 'libpng' 'libpulse' 'libogg' 'fribidi' 'libtheora' 'libvorbis' 'libbluray' 'xvidcore' 'ncurses' 'fontconfig' 'freetype2' 'libxext' 'libvdpau' 'libgl' 'openal' 'speex' 'libmpeg2' 'glibc' 'lame' 
)

makedepends=('xorgproto' 'libxxf86vm' 'libmad' 'libxinerama' 'libmng' 'libxss' 'smbclient' 'aalib' 'jack2' 'libcaca' 'faac' 'faad2' 'lirc' 'libxv' 'libxvmc' 'enca' 'libdca' 'a52dec' 'libvpx' 'unzip' 'mesa' 'live-media' 'yasm' 'git' 'mpg123' 'ladspa' 'libcdio' 'zlib' 'libcdio-paranoia' 'x264' 'rtmpdump' 'libdvdcss' 'libdvdread' 'libdvdnav' 'ffmpeg' 'giflib' 'libbs2b' 'fribidi' 'opus' 'libvorbis' 'gsm' 'libpulse' 'alsa-lib' 'glibc' 'libass' 'libjpeg' 'libpng' 'libogg' 'libtheora' 'libbluray' 'xvidcore' 'ncurses' 'fontconfig' 'freetype2' 'libx11' 'libxext' 'libvdpau' 'libgl' 'lame' 'desktop-file-utils' 'ttf-font' 'openal' 'speex' 'libmpeg2'
)

conflicts=('mplayer' 'mencoder')
provides=('mplayer' 'mencoder')
install=mplayer-gui.install
options=('!emptydirs')
source=("http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.4.tar.xz"
"https://mplayerhq.hu/MPlayer/skins/Blue-1.13.tar.bz2"
)
sha512sums=('8ef71cad187d8c8f81c837279bd3a421b440c892d3347a667670b21c954007e35cf0d15828f0901f347b9c1b053e8da4bc7f0fb6de34382d1e463074923d7b34'
'81205cc2334453ed23d94b9bb9efb9828764ba573abb745da0ae0fbffab019df996b2799a54a9a7b6eb77dac39925403131121d100588c4a7526d8b9dab474d8'
)

build() {
  cd "MPlayer-1.4"
  ./configure --prefix=/usr --enable-runtime-cpudetection --enable-gui  --disable-vidix --enable-gl --language=all --language-msg=all
  make
}

package() {
  cd "MPlayer-1.4"
  make DESTDIR="$pkgdir" install
  mv $srcdir/Blue $pkgdir/usr/share/mplayer/skins/default
}

