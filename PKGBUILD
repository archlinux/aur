# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=caudec
pkgver=1.7.5
pkgrel=2
pkgdesc='A multiprocess audio converter that supports many formats (FLAC, MP3, Ogg Vorbis, Windows codecs and many more)'
arch=(any)
url='http://caudec.cocatre.net'
license=('GPL3' 'custom:MPL2')

source=("$url/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('872de1b54cfbc539b4172718a806650b')
depends=('bash' 'procps-ng' 'grep' 'bc' 'which' 'coreutils' 'sox' 'sed' 'findutils')
optdepends=(
  "wget: checking for new versions"
  "flac: FLAC encoding and decoding"
  "flake: alternative FLAC encoder"
  "wavpack: WavPack encoding and decoding"
  "mac: Monkey's Audio encoding and decoding"
  "ffmpeg: Apple Lossless (ALAC), Monkey's Audio and AAC support"
  "lame: MP3 encoding"
  "vorbis-tools: Ogg Vorbis encoding"
  "neroaacenc: Nero AAC encoding"
  "neroaactag: Nero AAC tagging"
  "neroaacdec: Nero AAC decoding (and Replaygain)"
  "musepack-tools: Musepack encoding"
  "opus-tools: Opus encoding"
  "wine: Windows codecs support (TAK, lossyWAV, qaac, etc)"
  "cksfv: CRC32 hashing"
  "wavegain: Replaygain for Monkey's Audio, TAK, ALAC"
  "vorbisgain: Replaygain for Ogg Vorbis"
  "mp3gain: Replaygain for MP3"
  "aacgain-cvs: Replaygain for AAC"
  "gawk: required for SoundCheck support"
  "python2-eyed3: for MP3 artwork and Replaygain support"
)
backup=('etc/caudecrc')

package() {
  cd $pkgname-$pkgver
  install -Dm755 caudec "$pkgdir/usr/bin/caudec"
  install -Dm755 APEv2 "$pkgdir/usr/bin/APEv2"
  install -Dm644 caudecrc "$pkgdir/etc/caudecrc"
  install -Dm644 LICENSE-APEv2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APEv2"
}

# vim:set ts=2 sw=2 et:
