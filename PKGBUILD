# Maintainer: JohnyRi <honza dot rindt at gmail dot com>
# Contributor: Hugo Osvaldo Barrera <hugo at osvaldobarrera dot com dot ar>

pkgname=hybrid-encoder
pkgver=150711
pkgrel=1
pkgdesc="A very complete gui for video encoding"
arch=('i686' 'x86_64')
license=('custom')
depends=('framecounter' 'freetype2' 'glib2' 'openssl' 'qt5-multimedia')
optdepends=('aften: support for AC-3 audio encoding'
'bdsup2subpp-git: support for subtitle converison for image based stream formats'
'dcaenc: support for DTS audio encoding'
'delaycut-git: AC-3, DTS, MPA and WAV audio delay and cutting support' 
'divx265: support for H.265 video encoding'  
'fdkaac: support for AAC audio encoding'
'flac: support for lossless FLAC audio encoding'
'gpac: support for MP4 container muxing'
'kvazaar-git: support for H.265 video encoding'
'libvpx: support fot VP8 video encoding'
'lsdvd: support for listing the content of DVD disks'
'mediainfo: support for technical and tag information about a video or audio file'
'mencoder: support for video and audio encoding'
'mkvtoolnix-cli: support for MKV container muxing'
'mp4fpsmod: support for MP4 time code modification'
'mplayer: support for video preview'
'neroaacenc: support for NERO AAC audio encoding'
'opus-tools: support for Opus audio encoding'
'sox: support for processing of audio files'
'telxcc-git: support for closed caption extraction from TS files'
'tsmuxer: support for TS container'
'x264: support for H.264 video encoding'
'x265: support for H.265 video encoding')
url="http://www.selur.de/"

if test "$CARCH" == x86_64; then
  source=(http://www.selur.de/sites/default/files/hybrid_downloads/Hybrid_${pkgver}_64bit_binary_qt521.zip
          hybrid.desktop
          Hybrid.png)
  md5sums=('8afa0f61017a9c1fd4b3c8a25ca46983'
           'dd87c6eb6df85049de38c61dfe400347'
           '798dd936a3bc9bcd3b131d5dd6db96e6')
fi

if test "$CARCH" == i686; then
  source=(http://www.selur.de/sites/default/files/hybrid_downloads/Hybrid_${pkgver}_32bit_binary_qt521.zip
          hybrid.desktop
          Hybrid.png)
  md5sums=('c96d53cf4716609ff1833f98895f00f7'
           'dd87c6eb6df85049de38c61dfe400347'
           '4e6fd38ed527ae69653081ed94ba099b')
fi

package() {
  cd "${srcdir}"
  install -D -m755 Hybrid "${pkgdir}"/usr/bin/Hybrid
  install -D -m644 hybrid.desktop "${pkgdir}"/usr/share/applications/hybrid.desktop
  install -D -m644 Hybrid.png "${pkgdir}"/usr/share/pixmaps/Hybrid.png
}
