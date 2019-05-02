# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=selene-media-converter
pkgver=17.7
pkgrel=2
pkgdesc="A simple but powerful audio/video converter for many formats"
arch=(i686 x86_64)
url="http://teejeetech.blogspot.in/p/selene-media-encoder.html"
license=(GPL3)
depends=(gtk3 json-glib libgee libsoup mediainfo ffmpeg)
optdepends=('gpac: MP4Box muxer'
            'fdk-aac-enc: Fraunhofer FDK AAC encoder'
            'libav-no-libs: Libav encoder'
            'libkate: Kate subtitle encoder'
            'lame: LAME Mp3 encoder'
            'mkvtoolnix-cli: Matroska muxer'
            'mplayer: Media player'
            'mpv: Media player'
            'neroaacenc-bin: Nero AAC Audio encoder'
            'libogg: OGG audio encoder'
            'liboggz: OGG merge tool'
            'opus-tools: Opus audio encoder'
            'smplayer: media player'
            'sox: SoX audio processing utility'
            'vlc: media player'
            'libvpx: VP8 video encoder'
            'x264: H.264 video encoder'
            'x265: H.265 video encoder')
makedepends=(vala chrpath)
conflicts=(selene-media-encoder selene-media-encoder-bzr)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/teejee2008/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('8af31e921872c102d54c0db3b1d1c8fc')

build() {
  cd "$srcdir/selene-${pkgver}"
  make
}

package() {
  cd "$srcdir/selene-${pkgver}"
  make DESTDIR="$pkgdir/" install
  chrpath --delete ${pkgdir}/usr/bin/selene
  rm ${pkgdir}/usr/bin/selene-uninstall
}
