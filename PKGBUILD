# Maintainer: tytan652 <tytan652[at]tytanium[dot]xyz>

DISTRIB_ID=`lsb_release --id | cut -f2 -d$'\t'`

pkgname=vlc-luajit
_vlcver=3.0.17.4
# optional fixup version including hyphen
_vlcfixupver=
pkgver=${_vlcver}${_vlcfixupver//-/.r}
pkgrel=8
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player built with luajit for OBS Studio compatibility'
url='https://www.videolan.org/vlc/'
arch=('i686' 'x86_64' 'aarch64')
license=('LGPL2.1' 'GPL2')
_aomver=3
_dav1dver=1.0.0
_libmicrodnsver=0.2
_libplacebover=4.192
_libupnpver=1.14
_libvpxver=1.11
_protobufver=21
_srtver=1.5
_x264ver=0.164
_x265ver=3.5
depends=(
  'a52dec' 'libdvbpsi' 'libxpm' 'libdca' 'libproxy' 'luajit' 'libidn'
  'libmatroska' 'taglib' 'libmpcdec' 'faad2' 'libmad'
  'libmpeg2' 'xcb-util-keysyms' 'libtar' 'libxinerama' 'libsecret'
  'libarchive' 'qt5-base' "ffmpeg>=5"
  'qt5-x11extras' 'qt5-svg' 'freetype2' 'fribidi' 'harfbuzz'
  'fontconfig' 'libxml2' 'gnutls' 'libplacebo' 'wayland-protocols'
)
# To manage dependency rebuild easily, this will prevent you to rebuild VLC on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  depends+=(
    'libplacebo'
    'libupnp'
  )
else
  depends+=(
    "libplacebo>=$_libplacebover"
    "libupnp>=$_libupnpver"
  )
fi
makedepends=(
  'gst-plugins-base-libs' 'live-media' 'libnotify' 'libbluray'
  'flac' 'libdc1394' 'libavc1394' 'libcaca' 'gtk3'
  'librsvg' 'libgme' 'xosd' 'twolame' 'aalib' 'avahi' 'systemd-libs'
  'libmtp' 'libdvdcss' 'smbclient'
  'vcdimager' 'libssh2' 'mesa' 'libnfs' 'mpg123'
  'libdvdread' 'libdvdnav' 'libogg' 'libshout' 'libmodplug'
  'libvorbis' 'speex' 'opus' 'libtheora' 'libpng' 'libjpeg-turbo'
  'zvbi' 'libass' 'libkate' 'libtiger'
  'sdl_image' 'libpulse' 'alsa-lib' 'jack' 'libsamplerate' 'libsoxr'
  'lirc' 'libgoom2' 'projectm' 'chromaprint'
  'aribb24' 'aribb25' 'pcsclite' 'lua51' 'lsb-release'
)
# To manage dependency rebuild easily, this will prevent you to rebuild VLC on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  makedepends+=(
    'aom'
    'dav1d'
    'libmicrodns'
    'libvpx'
    'x264'
    'x265'
    'protobuf'
    'srt'
  )
else
  makedepends+=(
    "aom>=$_aomver"
    "dav1d>=$_dav1dver"
    "libmicrodns>=$_libmicrodnsver"
    "libvpx>=$_libvpxver"
    "x264>=$_x264ver"
    "x265>=$_x265ver"
    "protobuf>=$_protobufver"
    "srt>=$_srtver"
  )
fi
optdepends=(
  'avahi: service discovery using bonjour protocol'
  'gst-plugins-base-libs: for libgst plugins'
  'dav1d: dav1d AV1 decoder'
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
  'systemd-libs: udev services discovery'
  'smbclient: SMB access plugin'
  'libcdio: audio CD playback'
  'gnu-free-fonts: subtitle font '
  'ttf-dejavu: subtitle font'
  'libssh2: sftp access'
  'libnfs: NFS access'
  'mpg123: mpg123 codec'
  'lua51-socket: http interface'
  'libdvdread: DVD input module'
  'libdvdnav: DVD with navigation input module'
  'libogg: Ogg and OggSpots codec'
  'libshout: shoutcast/icecast output plugin'
  'libmodplug: MOD output plugin'
  'libvorbis: Vorbis decoder/encoder'
  'speex: Speex codec'
  'opus: opus codec'
  'libtheora: theora codec'
  'libpng: PNG support'
  'libjpeg-turbo: JPEG support'
  'librsvg: SVG plugin'
  'zvbi: VBI/Teletext/webcam/v4l2 capture/decoding'
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
  'aribb24: aribsub support'
  'aribb25: aribcam support'
  'pcsclite: aribcam support'
)
# To manage dependency rebuild easily, this will prevent you to rebuild VLC on non-updated system
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  optdepends+=(
    'aom: AOM AV1 codec'
    'dav1d: dav1d AV1 decoder'
    'protobuf: chromecast streaming'
    'libmicrodns: mDNS services discovery (chromecast etc)'
    'libvpx: VP8 and VP9 codec'
    'x264: H264 encoding'
    'x265: HEVC/H.265 encoder'
    'srt: SRT input/output plugin'
  )
else
  optdepends+=(
    "aom>=$_aomver: AOM AV1 codec"
    "dav1d>=$_dav1dver: dav1d AV1 decoder"
    "protobuf>=$_protobufver: chromecast streaming"
    "libmicrodns>=$_libmicrodnsver: mDNS services discovery (chromecast etc)"
    "libvpx>=$_libvpxver: VP8 and VP9 codec"
    "x264>=$_x264ver: H264 encoding"
    "x265>=$_x265ver: HEVC/H.265 encoder"
    "srt>=$_srtver: SRT input/output plugin"
  )
fi
_name=vlc
conflicts=("${_name}" 'vlc-dev' 'vlc-plugin' 'vlc-stable-git')
provides=("${_name}=${pkgver}")
options=('debug' '!emptydirs')
source=(https://download.videolan.org/${_name}/${_vlcver}/${_name}-${_vlcver}${_vlcfixupver}.tar.xz
        'update-vlc-plugin-cache.hook'
        'vlc-live-media-2021.patch'
        'dav1d_v1.patch' # https://code.videolan.org/videolan/vlc/-/commit/2202c892c8dc1381b596c53c2ebd3ca680061f95
        'dav1d_v1_limit.patch') # https://code.videolan.org/videolan/vlc/-/commit/d38ddd7270ffaea705981b6a48086778850d3c96
sha512sums=('dac14c6586603c064294672eb878253e52b3a7bef431fb10303345e5400591b5c1f2d452a2af03f503db0ca186582a84be06fdf05ab011c33f7b0bd5389c51fb'
            'b247510ffeadfd439a5dadd170c91900b6cdb05b5ca00d38b1a17c720ffe5a9f75a32e0cb1af5ebefdf1c23c5acc53513ed983a736e8fa30dd8fad237ef49dd3'
            'ad17d6f4f2cc83841c1c89623c339ec3ee94f6084ea980e2c8cbc3903854c85e5396e31bfd8dc90745b41794670903d854c4d282d8adec263087a9d47b226ccc'
            '5f7aa43a7b248812758a8ef82d15d59fb566327fc3e837002a8f4741cabde09ed7caca905f6fe168554b9a4b7561816b3eff877f4dd6664ceaf0964281facb4f'
            '4aca4979fe7516ee9d39ae8e2c91c0f981a033ed5c6a74eaf86569df8bbcf72ab0be037f27c8af78f26c23dc181e52bbf4a3e0209e07160fdb03e8fa33e6bc38')

if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
source+=(
  "$pkgname.hook"
  "$pkgname.sh"
)
sha512sums+=(
  "387bc13bd61ab926228d58e102271a964415f11a175778323487080a7ebc424d1a6148d5705e1563eee49c9ea6407643f82e274478b589664c9fcdffb6177f99"
  "698b3ee23d02677cd46950adc5188320ff4e5ead76d655db8d276558ee6745a567bec878c68a76b65728a6d893919b2cd4c9c6fec544461762df52476e4a8fe6")
fi

prepare() {
  cd ${_name}-${_vlcver}
  sed -e 's:truetype/ttf-dejavu:TTF:g' -i modules/visualization/projectm.cpp
  sed -e 's|-Werror-implicit-function-declaration||g' -i configure
  sed 's|whoami|echo builduser|g' -i configure
  sed 's|hostname -f|echo arch|g' -i configure
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Fix to build against libcaca 0.99.beta20
  sed -i 's/cucul_/caca_/g' modules/video_output/caca.c
  sed -i 's/CUCUL_COLOR/CACA/g' modules/video_output/caca.c

  autoreconf -vf
}

if [[ $CARCH == 'x86_64' ]]; then
  GLES=--disable-gles2
elif [[ $CARCH == 'i686' ]]; then
  GLES=--disable-gles2
elif [[ $CARCH == 'aarch64' ]]; then
  GLES=--enable-gles2
fi

build() {
  cd ${_name}-${_vlcver}

  export CFLAGS+=" -I/usr/include/samba-4.0"
  export CPPFLAGS+=" -I/usr/include/samba-4.0 -ffat-lto-objects"
  export CXXFLAGS+=" -std=c++11"
  # OBS Studio use luajit which is a drop-in for lua5.1
  # So lets build VLC with luajit and luac5.1 rather than lua5.2 and luac5.2
  # Which will make OBS not crash when loading a VLC (Video) Source
  export LUAC=/usr/bin/luac5.1
  export LUA_LIBS="$(pkg-config --libs luajit)"
  export LUA_CFLAGS="$(pkg-config --cflags luajit)"
  export RCC=/usr/bin/rcc-qt5

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-kde-solid=/usr/share/solid/actions/ \
    --disable-rpath \
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
    --enable-realrtsp \
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
    --disable-fdkaac \
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
    --enable-aa \
    --enable-caca \
    --enable-pulse \
    --enable-alsa \
    --enable-jack \
    --enable-samplerate \
    --enable-soxr \
    --enable-chromaprint \
    --enable-chromecast \
    --enable-qt \
    --enable-skins2 \
    --enable-libtar \
    --enable-ncurses \
    --enable-lirc \
    --enable-goom \
    --enable-projectm \
    --enable-avahi \
    --enable-mtp \
    --enable-upnp \
    --enable-microdns \
    --enable-libxml2 \
    --disable-libgcrypt \
    --enable-gnutls \
    --enable-taglib \
    --enable-secret \
    --enable-kwallet \
    --disable-update-check \
    --enable-notify \
    --enable-libplacebo \
    --enable-vlc \
    --enable-aribsub \
    --enable-aribcam \
    --enable-aom \
    --enable-srt \
    --enable-dav1d \
    --disable-decklink \
    --disable-libva \
    $GLES

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_name}-${_vlcver}

  make DESTDIR="${pkgdir}" install

  for res in 16 32 48 128 256; do
    install -Dm 644 "${srcdir}/vlc-${_vlcver}/share/icons/${res}x${res}/vlc.png" \
                     "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png"
  done
  install -Dm 644 "${srcdir}/update-vlc-plugin-cache.hook" -t "${pkgdir}/usr/share/libalpm/hooks"

  if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
    install -D -m644 "$srcdir/$pkgname.hook" -t "${pkgdir}"/usr/share/libalpm/hooks/
    install -D -m755 "$srcdir/$pkgname.sh" -t "${pkgdir}"/usr/share/libalpm/scripts/
  fi
}
