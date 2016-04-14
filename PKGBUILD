# Maintainer: bluemeda <affif[dot]bluemeda[at]gmail[dot]com>
_name=spotify-ripper
pkgname=spotify-ripper
pkgver=2.8.6
pkgrel=1
pkgdesc='a small ripper for Spotify that rips Spotify URIs to audio files'
arch=('any')
url="https://github.com/jrnewell/$_name"
license=('MIT')
depends=('python2' 'python2-pyspotify=2.0.5' 'python2-colorama=0.3.3' 'python2-mutagen=1.30' 'python2-requests>=2.3.0' 'python2-schedule>=0.3.1' 'lame')
optdepends=('flac: Rip songs to lossless FLAC encoding' 'opus-tools: Rip songs to Opus encoding' 'vorbis-tools: Rip songs to Ogg Vorbis encoding' 'faac: Rip songs to AAC format with FreeAAC' 'libav-git-no-libs: Rip songs to Apple Lossless format' 'fdkaac: Rip songs to MP4/M4A format with Fraunhofer FDK AAC codec')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
md5sums=('53d98e1a8ced9186c854137bc6800733')

package() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
}
