_name=spotify-ripper
pkgname=spotify-ripper
pkgver=2.11
pkgrel=1
pkgdesc='Command-line ripper for Spotify, with a workaround for playlist emptying'
arch=('any')
url="https://github.com/SolidHal/$_name"
license=('MIT')
depends=('python2' 'python2-pyspotify=2.0.5' 'python2-colorama-0.3.3' 'python2-mutagen-1.30' 'python2-requests>=2.3.0' 'python2-schedule>=0.3.1' 'python2-spotipy' 'lame')
optdepends=('flac: Rip songs to lossless FLAC encoding' 'opus-tools: Rip songs to Opus encoding' 'vorbis-tools: Rip songs to Ogg Vorbis encoding' 'faac: Rip songs to AAC format with FreeAAC' 'libav-git-no-libs: Rip songs to Apple Lossless format' 'fdkaac: Rip songs to MP4/M4A format with Fraunhofer FDK AAC codec')
makedepends=('python2-setuptools')
source=("https://github.com/SolidHal/spotify-ripper/archive/"$pkgver".zip")
md5sums=('9e15172c41c80eb46b149a3799f9e66a')

package() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
}
