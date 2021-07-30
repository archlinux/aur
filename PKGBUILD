# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.7.1
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
b2sums=('0a8ad178b73e8f7f1656daad58dd109466838a3c0ff50e6250b79f99488ee27083f3740fb1dacd483b0477b40f2b7e500d5a1ea8629f04b92990ee432e1983df')

build() {
  cd spotdl-$pkgver

  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

