# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.7.2
pkgrel=1
pkgdesc="Download your Spotify playlists and songs along with album art and metadata (from YouTube if a match is found)."
arch=('any')
url="https://github.com/spotDL/spotify-downloader"
license=('MIT')
depends=('python-setuptools' 
	 'ffmpeg' 
	 'python-spotipy' 
	 'python-pytube' 
	 'python-rich' 
	 'python-rapidfuzz' 
	 'python-mutagen' 
	 'python-ytmusicapi' 
	 'python-tqdm' 
	 'python-beautifulsoup4' 
	 'python-requests' 
	 'python-unidecode')

source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
b2sums=('b3aeb59f8a8cfa31084985367d909caeb264be3f3915ca53b83cce4d4967feee8d87d1e91690dfae86c5a14f149312d0537360a4cd01094bc6381a0efdf7cdad')

build() {
  cd spotdl-$pkgver

  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

