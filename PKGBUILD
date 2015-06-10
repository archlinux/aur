# Maintainer: Corelli <corelli AT yepmail DOT net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

pkgname=xcfa_cli
pkgver=0.0.7
pkgrel=3
pkgdesc="Audio Files Conversion - CLI version"
arch=('i686' 'x86_64')
url="http://www.xcfa.tuxfamily.org/static9/xcfa-cli"
license=('GPL3')
depends=('taglib' 'alsa-lib' 'curl' 'desktop-file-utils')
optdepends=('a52dec: Decode ATSC A/52 audio streams', 'aacplusenc: AAC+ encoder', 'mp3check: Check MP3 files for consistency', 'faac: Audio Codeur freeware', 'faad2: MPEG-4 and MPEG-2 AAC decoder', 'flac: WAV/FLAC Conversion', 'lame: WAV/MP3 Conversion', 'mac: Monkey Audio Console Front End/APE', 'musepack-tools: Musepack decoder/encoder', 'mplayer: player and extractor', 'mp3gain: Lossless MP3 normalizer', 'normalize: WAV files normalizer', 'libnotify: Desktop notification library', 'shorten: Fast compression for waveform files', 'shntool: A multi-purpose WAVE data processing and reporting utility', 'sox: The Swiss Army knife of sound processing tools', 'vorbis-tools: WAV/OGG Conversion', 'vorbisgain: Calculate the replay gain for Ogg Vorbis files', 'wavpack: Hybrid Lossless Audio Compressor')
conflicts=('xcfa')
source=(http://download.tuxfamily.org/xcfaudio/xcfa_cli/$pkgname-$pkgver.tar.gz) 
md5sums=('3e4a541e8f5a4142ec508cdf35c34b6a')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr 
  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" install
}

