# $Id$
# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_pkgbase=vlc
pkgname=vlc-nox
pkgver=3.0.20
pkgrel=2
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player (without X support)'
url='https://www.videolan.org/vlc/'
arch=('x86_64')
license=(
  'GPL-2.0-or-later'
  'LGPL-2.1-or-later'
)
depends=(
  'a52dec'
  'abseil-cpp'
  'aribb24'
  'bash'
  'cairo'
  'dbus'
  'faad2'
  'ffmpeg4.4' # NOTE: switch to ffmpeg4.4, as ffmpeg >= 5 requires extensive changes disabling VAAPI (only supported with vlc >= 4)
  'fontconfig'
  'freetype2'
  'fribidi'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gnutls'
  'harfbuzz'
  'hicolor-icon-theme'
  'libarchive'
  'libdca'
  'libdvbpsi'
  'libglvnd'
  'libidn'
  'libmad'
  'libmatroska'
  'libmpcdec'
  'libmpeg2'
  'libproxy'
  'libsecret'
  'libtar'
  'libupnp' 'libixml.so' 'libupnp.so'
  'libva'
  'libx11'
  'libxcb'
  'libxinerama'
  'libxml2'
  'libxpm'
  'lua'
  'taglib'
  'xcb-util-keysyms'
  'zlib'
)
makedepends=(
  'aalib'
  'alsa-lib'
  'aom'
  'aribb25'
  'avahi'
  'dav1d'
  'flac'
  'fluidsynth'
  'jack'
  'libass'
  'libavc1394'
  'libbluray'
  'libcaca'
  'libdc1394'
  'libdvdcss'
  'libdvdnav'
  'libdvdread'
  'libgme'
  'libgoom2'
  'libjpeg-turbo'
  'libkate'
  'libmicrodns'
  'libmodplug'
  'libmtp'
  'libnfs'
  'libogg'
  'libpng'
  'libpulse'
  'librsvg'
  'libsamplerate'
  'libshout'
  'libsoxr'
  'libssh2'
  'libtheora'
  'libtiger'
  'libvorbis'
  'libvpx'
  'lirc'
  'live-media'
  'mesa'
  'mpg123'
  'opus'
  'pcsclite'
  'projectm'
  'protobuf'
  'sdl_image'
  'smbclient'
  'speex'
  'srt'
  'systemd-libs'
  'twolame'
  'vcdimager'
  'x264' 'libx264.so'
  'x265' 'libx265.so'
  'xosd'
  'zvbi'
)
optdepends=(
  'aalib: ASCII art video output'
  'alsa-lib: ALSA audio output'
  'aom: AOM AV1 codec'
  'aribb25: aribcam support'
  'avahi: service discovery using bonjour protocol'
  'dav1d: dav1d AV1 decoder'
  'flac: Free Lossless Audio Codec plugin'
  'fluidsynth: FluidSynth based MIDI playback plugin'
  'gnu-free-fonts: subtitle font'
  'jack: jack audio server'
  'libass: Subtitle support'
  'libavc1394: devices using the 1394ta AV/C'
  'libbluray: Blu-Ray video input'
  'libcaca: colored ASCII art video output'
  'libcdio: audio CD playback'
  'libdc1394: IEEE 1394 access plugin'
  'libdvdcss: decoding encrypted DVDs'
  'libdvdnav: DVD with navigation input module'
  'libdvdread: DVD input module'
  'libgme: Game Music Emu plugin'
  'libgoom2: Goom visualization'
  'libjpeg-turbo: JPEG support'
  'libkate: Kate codec'
  'libmicrodns: mDNS services discovery (chromecast etc)'
  'libmodplug: MOD output plugin'
  'libmtp: MTP devices discovery'
  'libnfs: NFS access'
  'libnotify: notification plugin'
  'libogg: Ogg and OggSpots codec'
  'libpng: PNG support'
  'libpulse: PulseAudio audio output'
  'libraw1394: IEEE 1394 access plugin'
  'librsvg: SVG plugin'
  'libsamplerate: audio Resampler'
  'libshout: shoutcast/icecast output plugin'
  'libsoxr: SoX audio Resampler'
  'libssh2: sftp access'
  'libtheora: theora codec'
  'libtiger: Tiger rendering for Kate streams'
  'libva-intel-driver: video backend intel'
  'libva-vdpau-driver: vdpau backend nvidia'
  'libvorbis: Vorbis decoder/encoder'
  'libvpx: VP8 and VP9 codec'
  'lirc: lirc control'
  'live-media: streaming over RTSP'
  'lua-socket: http interface'
  'mpg123: mpg123 codec'
  'ncurses: ncurses interface'
  'opus: opus codec'
  'pcsclite: aribcam support'
  'projectm: ProjectM visualisation'
  'protobuf: chromecast streaming'
  'sdl12-compat: SDL image support'
  'sdl_image: SDL image support'
  'smbclient: SMB access plugin'
  'speex: Speex codec'
  'speexdsp: Speex codec'
  'srt: SRT input/output plugin'
  'systemd-libs: udev services discovery'
  'ttf-dejavu: subtitle font'
  'twolame: TwoLAME mpeg2 encoder plugin'
  'vcdimager: navigate VCD with libvcdinfo'
  'x264: H264 encoding'
  'x265: HEVC/H.265 encoder'
  'zvbi: VBI/Teletext/webcam/v4l2 capture/decoding'
)
conflicts=('vlc' 'vlc-plugin' 'vlc-git')
replaces=('vlc' 'vlc-plugin' 'vlc-git')
options=('!emptydirs')
source=(
  http://download.videolan.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz
  update-vlc-plugin-cache.hook
  taglib-2.patch
)
sha512sums=('02e58fb52dd75bf483ac4b298aecf86463b13d4782173d164adba6e4552d9262ff5e2ee1cbe1bce2c8a809801b79f328c6a8c475d34ae62aefaea02ae5ade406'
            'b247510ffeadfd439a5dadd170c91900b6cdb05b5ca00d38b1a17c720ffe5a9f75a32e0cb1af5ebefdf1c23c5acc53513ed983a736e8fa30dd8fad237ef49dd3'
            'ea0d1e1dfed16dac8f9027eb55d987dee59630568b9744ceb42bfa134ea9295252d83574f3d793a76a5be3b02661c1731ed366003b6b55b2d7f02fde70586ff3')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
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
  autoreconf -vf
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  export CFLAGS+=" -I/usr/include/samba-4.0 -ffat-lto-objects"
  export CPPFLAGS+=" -I/usr/include/samba-4.0"
  export CXXFLAGS+=" -std=c++17"
  export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig"
  export LUAC=/usr/bin/luac
  export LUA_LIBS="$(pkg-config --libs lua)"
  export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig/:$PKG_CONFIG_PATH"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
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
    --enable-fluidsynth \
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
    --disable-wayland \
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
    --disable-chromaprint \
    --enable-chromecast \
    --disable-qt \
    --disable-skins2 \
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
    --disable-kwallet \
    --disable-update-check \
    --disable-notify \
    --disable-libplacebo \
    --enable-vlc \
    --enable-aribsub \
    --enable-aribcam \
    --enable-aom \
    --enable-srt \
    --enable-dav1d

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  for res in 16 32 48 128 256; do
    install -Dm 644 "${srcdir}/vlc-${pkgver}/share/icons/${res}x${res}/vlc.png" \
                     "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png"
  done
  install -Dm 644 "${srcdir}/update-vlc-plugin-cache.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
}

# vim: ts=2 sw=2 et:
