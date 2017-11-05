# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>
# https://github.com/FabioLolix  

pkgname=selene-media-converter
pkgver=17.7
pkgrel=1
pkgdesc="A simple but powerful audio/video converter for many formats"
arch=('i686' 'x86_64')
url="http://teejeetech.blogspot.in/p/selene-media-encoder.html"
license=('GPL3')
depends=('gtk3' 'json-glib' 'libgee' 'libsoup' 'mediainfo' 'ffmpeg')
optdepends=('gpac: MP4Box muxer'
            'fdk-aac-enc: Fraunhofer FDK AAC encoder'
            'libav-no-libs: Libav encoder'
            'libkate: Kate subtitle encoder'
            'lame: LAME Mp3 encoder'
            'mkvtoolnix-cli: Matroska muxer'
            'mplayer: Media player'
            'mpv: Media player'
            'neroaac: Nero AAC Audio encoder'
            'neroaacenc: Nero AAC Audio encoder'
            'libogg: OGG audio encoder'
            'liboggz: OGG merge tool'
            'opus-tools: Opus audio encoder'
            'smplayer: media player'
            'sox: SoX audio processing utility'
            'vlc: media player'
            'libvpx: VP8 video encoder'
            'x264: H.264 video encoder'
            'x265: H.265 video encoder')
makedepends=('vala' 'chrpath')
provides=('selene-media-converter' 'selene-media-encoder')
conflicts=('selene-media-converter' 'selene-media-encoder' 'selene-media-encoder-bzr')
source=("https://github.com/teejee2008/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('5e028327c64cadcf244b62baca17a92a')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  chrpath --delete ${pkgdir}/usr/bin/selene
  rm ${pkgdir}/usr/bin/selene-uninstall
}
