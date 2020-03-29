# $Id$
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Sebastian Weiland <sebastianweiland97@gmail.com>
# Contributor: Martchus <martchus@gmx.net>
# Original package: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

_appname_=vlc
pkgname=${_appname_}-nightly
pkgver=4.0.0v20200328
_pkgver=4.0.0
_snapshot_=20200328
_snapver_=0231
_suffix_=dev
_nightly_=${_snapshot_}-${_snapver_}
pkgrel=1
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player - nightly snapshot'
url='https://nightlies.videolan.org/'
arch=('x86_64')
license=('LGPL2.1' 'GPL2')
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'a52dec' 'libdvbpsi'
         'libxpm'  'libdca' 'libproxy' 'lua' 'libidn' 'aribb25' 'libvncserver'
         'libmatroska' 'taglib' 'libmpcdec' 'ffmpeg' 'faad2' 'libupnp' 'libmad'
         'libmpeg2' 'xcb-util-keysyms' 'libtar' 'libxinerama' 'libsecret'
         'libarchive' 'qt5-base'  'libgcrypt' 'qt5-x11extras' 'qt5-svg' 'freetype2'
         'fribidi' 'harfbuzz' 'fontconfig' 'libxml2' 'gnutls' 'libplacebo'
         'wayland-protocols' 'aribb24' 'libfdk-aac')
makedepends=('gst-plugins-base-libs' 'live-media' 'libnotify' 'libbluray'
             'flac' 'libdc1394' 'libavc1394' 'libcaca' 'gtk3' 'lua'
             'librsvg' 'libgme' 'xosd' 'twolame' 'aalib' 'avahi' 'libsystemd'
             'libmtp' 'libdvdcss' 'smbclient' 'flex' 'bison'
             'vcdimager' 'libssh2' 'mesa' 'protobuf' 'libnfs' 'mpg123' 'srt'
             'libdvdread' 'libdvdnav' 'libogg' 'libshout' 'libmodplug' 'libvpx'
             'libvorbis' 'speex' 'opus' 'libtheora' 'libpng' 'libjpeg-turbo'
             'libx265.so' 'libx264.so' 'zvbi' 'libass' 'libkate' 'libtiger'
             'sdl_image' 'libpulse' 'alsa-lib' 'jack' 'libsamplerate' 'libsoxr'
             'lirc' 'libgoom2' 'projectm' 'chromaprint'

             'fluidsynth' 'portaudio' 'sidplay2-libs' 'sndio' 'vulkan-headers')
optdepends=('avahi: service discovery using bonjour protocol'
            'gst-plugins-base-libs: for libgst plugins'
            'libdvdcss: decoding encrypted DVDs'
            'libavc1394: devices using the 1394ta AV/C'
            'libdc1394: IEEE 1394 access plugin'
            'kwallet: kwallet keystore'
            'libva-vdpau-driver: vdpau backend nvidia'
            'libva-intel-driver: video backend intel'
            'libbluray: Blu-Ray video input'
            'flac: Free Lossless Audio Codec plugin'
            'twolame: TwoLAME mpeg2 encoder plugin'
            'libgme: Game Music Emu plugin'
            'vcdimager: navigate VCD with libvcdinfo'
            'libmtp: MTP devices discovery'
            'libsystemd: udev services discovery'
            'smbclient: SMB access plugin'
            'libcdio: audio CD playback'
            'ttf-freefont: subtitle font '
            'ttf-dejavu: subtitle font'
            'libssh2: sftp access'
            'libnfs: NFS access'
            'mpg123: mpg123 codec'
            'protobuf: chromecast streaming'
          #  'libmicrodns: mDNS services discovery (chromecast etc)'
            'lua-socket: http interface'
            'live-media: RTSP input'
            'libdvdread: DVD input module'
            'libdvdnav: DVD with navigation input module'
            'libogg: Ogg and OggSpots codec'
            'libshout: shoutcast/icecast output plugin'
            'libmodplug: MOD output plugin'
            'libvpx: VP8 and VP9 codec'
            'libvorbis: Vorbis decoder/encoder'
            'speex: Speex codec'
            'opus: opus codec'
            'libtheora: theora codec'
            'libpng: PNG support'
            'libjpeg-turbo: JPEG support'
            'librsvg: SVG plugin'
            'libx264: H264 encoding'
            'x265: HEVC/H.265 encoder'
            'zvbi: VBI/Teletext decoding'
            'libass: Subtitle support'
            'libkate: Kate codec'
            'libtiger: Tiger rendering for Kate streams'
            'sdl_image: SDL image support'
            'aalib: ASCII art video output'
            'libcaca: colored ASCII art video output'
            'libpulse: PulseAudio audio output'
            'alsa-lib: ALSA audio output'
            'jack: jack audio server'
            'libsamplerate: audio Resampler'
            'libsoxr: SoX audio Resampler'
            'chromaprint: Chromaprint audio fingerprinter'
            'lirc: lirc control'
            'libgoom2: Goom visualization'
            'projectm: ProjectM visualisation'
            'ncurses: ncurses interface'
            'libnotify: notification plugin'
            'gtk3: notification plugin'

            'fluidsynth: FluidSynth plugin for MIDI playback'
            'portaudio: portaudio support'
            'vcdimager: navigate VCD with libvcdinfo'
            'schroedinger: schroedinger codec support'
            'sidplay2-libs: for C64 sid demuxer'
            'sndio: for OpenBSD sndio audio output')
# note: removing 'daala-git: for Daala video support' because it is currently broken
#       if you want to redistribute the binary remove 'libfdk-aac: FDK AAC codec' 
conflicts=("${_appname_}-plugin" "${_appname_}")
provides=("${_appname_}")
replaces=("${_appname_}-plugin")
options=('!emptydirs')
source=("http://nightlies.videolan.org/build/source/vlc-${_pkgver}-${_nightly_}-${_suffix_}.tar.xz"
        'update-vlc-plugin-cache.hook'
        '0001-lua-Fix-build-using-lua-5.3.patch')

pkgver() {
 printf ${_pkgver}v$_snapshot_
}

prepare() {
  cd "${_appname_}-${_pkgver}-${_suffix_}"

  ./bootstrap

  patch -Np1 -i "${srcdir}/0001-lua-Fix-build-using-lua-5.3.patch"
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype/freetype.c
  sed -e 's|-Werror-implicit-function-declaration||g' -i configure
  sed 's|whoami|echo builduser|g' -i configure
  sed 's|hostname -f|echo arch|g' -i configure

}

build() {
  cd "${_appname_}-${_pkgver}-${_suffix_}"

  export CFLAGS+=" -I/usr/include/samba-4.0"
  export CPPFLAGS+=" -I/usr/include/samba-4.0"
  export CXXFLAGS+=" -std=c++11"
  export LUAC=/usr/bin/luac
  export LUA_LIBS="$(pkg-config --libs lua)"
  export RCC=/usr/bin/rcc-qt5
 # export CC=clang
 # export CXX=clang++

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-rpath \
              --with-kde-solid=/usr/share/solid/actions/ \
              --enable-nls \
              --enable-archive \
              --enable-live555 \
              --enable-dc1394 \
              --enable-dv1394 \
              --enable-dvdread \
              --enable-dvdnav \
              --enable-bluray \
              --disable-opencv \
              --enable-smbclient \
              --enable-sftp \
              --enable-nfs \
              --enable-dvbpsi \
              --enable-gme \
              --enable-ogg \
              --enable-shout \
              --enable-matroska \
              --enable-mod \
              --enable-mpc \
              --enable-mad \
              --enable-mpg123 \
              --enable-gst-decode \
              --enable-avcodec \
              --enable-libva \
              --enable-avformat \
              --enable-postproc \
              --enable-faad \
              --enable-vpx \
              --enable-twolame \
              --enable-a52 \
              --enable-dca \
              --enable-flac \
              --enable-libmpeg2 \
              --enable-vorbis \
              --enable-speex \
              --enable-opus \
              --enable-oggspots \
              --disable-schroedinger \
              --enable-png \
              --enable-jpeg \
              --enable-x264 \
              --enable-x265 \
              --enable-zvbi \
              --enable-libass \
              --enable-kate \
              --enable-tiger \
              --enable-vdpau \
              --enable-wayland \
              --enable-sdl-image \
              --enable-freetype \
              --enable-fribidi \
              --enable-harfbuzz \
              --enable-fontconfig \
              --enable-svg \
              --enable-svgdec \
              --enable-caca \
              --enable-pulse \
              --enable-alsa \
              --enable-jack \
              --enable-samplerate \
              --enable-soxr \
              --enable-chromaprint \
              --enable-chromecast \
              --enable-qt \
              --enable-libtar \
              --enable-ncurses \
              --enable-lirc \
              --enable-goom \
              --enable-projectm \
              --enable-avahi \
              --enable-mtp \
              --enable-upnp \
              --disable-microdns \
              --enable-libxml2 \
              --enable-libgcrypt \
              --enable-gnutls \
              --enable-taglib \
              --enable-secret \
              --enable-kwallet \
              --disable-update-check \
              --enable-notify \
              --enable-libplacebo \
              --enable-vlc \
              --enable-aribsub \
              \
              --libexecdir=/usr/lib \
	            --disable-daala \
	            --enable-fdkaac \
	            --disable-decklink \
              --enable-skins2 \
              --disable-medialibrary
  # note: removing --enable-daala for now because it is currently broken
  #       change --enable-fdkaac to --disable-fdkaac if you want to redistribute the binary
  #       adding --disable-decklink because it's a big mess that i don't want to touch even though it'll probably work now according to git
  #       adding --disable-skins2 because skins are currently broken thanks to changes in upstream concerning how playlist and player works.
  #       adding --disable-medialibrary medialibrary is broken 
  make V=1
}

package() {
  cd "${_appname_}-${_pkgver}-${_suffix_}"

  make -i DESTDIR="${pkgdir}" install

  for res in 16 32 48 128 256; do
    install -D -m644 "${srcdir}/${_appname_}-${_pkgver}-${_suffix_}/share/icons/${res}x${res}/${_appname_}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_appname_}.png"
  done

  install -Dm644 "$srcdir"/update-vlc-plugin-cache.hook "$pkgdir"/usr/share/libalpm/hooks/update-vlc-plugin-cache.hook

}

sha256sums=('984d90b4985028f6d87e18a007ea43eb938c339541d9c6d2ac9e1c1f39d6f446'
            'c6f60c50375ae688755557dbfc5bd4a90a8998f8cf4d356c10d872a1a0b44f3a'
            '3e6bddbaed443e40036c494a0754aedd2f94fe41bfa3754855e16f7452a03cdf')
