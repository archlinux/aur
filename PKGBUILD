
pkgname=acestream-player-data
pkgver=3.0.2
pkgrel=5
_ubuntuver=trusty
_ubunturel=2
_watch=('http://repo.acestream.org/ubuntu/dists/trusty/main/binary-amd64/Packages')
pkgdesc="ACE Stream player libraries files"
arch=('i686' 'x86_64')
url="http://acestream.org/"
license=('unknown')
depends=('a52dec' 'faad2' 'libdca' 'libdvdnav' 'libmad'
         'libpng12' 'libmatroska' 'libmpcdec' 'libmpeg2' 'libproxy' 'libshout' 'libupnp' 'libxpm'
         'lua51' 'qt4' 'qtwebkit' 'sdl_image' 'taglib' 'xcb-util-keysyms' 'ffmpeg-compat-54' 'libgcrypt15'
	 'libdvbpsi8' 'libx264-142')
optdepends=('aalib: for ASCII art plugin'
            'avahi: for service discovery using bonjour protocol'
            'flac: for Free Lossless Audio Codec plugin'
            'fluidsynth: for synthesizer MIDI FluidSynth'
            'gnome-vfs: for GNOME Virtual File System support'
            'kdelibs: KDE Solid hardware integration'
            'libavc1394: for devices using the 1394ta AV/C'
            'libbluray: for Blu-Ray support'
            'libcaca: for colored ASCII art video output'
            'libcdio: for audio CD playback support'
            'libnotify: for notification plugin'   
            'libdc1394: for IEEE 1394 plugin'
            'libdvdcss: for decoding encrypted DVDs'
            'libgme: for libgme plugin'
            'libgoom2: for libgoom plugin'
            'libmtp: for MTP devices support'
            'librsvg: for SVG plugin'
            'libssh2: for sftp support'
            'libva-vdpau-driver: vdpau back-end for nvidia'
            'libva-intel-driver: back-end for intel cards'
            'lirc-utils: for lirc plugin'
            'ncurses: for ncurses interface support'
            'opus: for opus support'
            'oss: for OSS audio support'
            'portaudio: for portaudio support'
            'projectm: for ProjectM visualisation plugin'
            'smbclient: for SMB access plugin'
            'twolame: for TwoLAME mpeg2 encoder plugin'
            'vcdimager: navigate VCD with libvcdinfo'
            'xosd: for xosd support'
            'ttf-freefont: for subtitle font')
conflicts=('acestream' 'libgcrypt11')
if [[ "$CARCH" == "i686" ]]; then
  source=("http://repo.acestream.org/ubuntu/pool/main/a/$pkgname/${pkgname}_${pkgver}-1${_ubuntuver}${_ubunturel}_i386.deb")
  sha256sums=('a57c5e27a39f5fc698679e2f4495181bf257cbfdcf39729c6e90b9692bc210cd')
else
  source=("http://repo.acestream.org/ubuntu/pool/main/a/$pkgname/${pkgname}_${pkgver}-1${_ubuntuver}${_ubunturel}_amd64.deb")
  sha256sums=('cd70131b173dd4fdbcdb1291bdeb1c163c092c615136302e02c7ea8b2ca2ee34')
fi

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

# create symlinks for libs that Ubuntu names differenly
  cd "$pkgdir/usr/lib"
  ln -s liba52.so.0.0.0 liba52-0.7.4.so
  ln -s liblua.so.5.2 liblua5.2.so.0
}
