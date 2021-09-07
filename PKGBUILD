# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.8.0
pkgrel=3

pkgdesc="Download your Spotify playlists and songs along with album art and metadata (from YouTube if a match is found)."
arch=('any')
url="https://github.com/spotDL/spotify-downloader"
license=('MIT')

depends=('python'
  'ffmpeg'
  'python-spotipy'
  'python-pytube'
  'python-rich'
  'python-rapidfuzz'
  'python-mutagen'
  'python-ytmusicapi'
  'yt-dlp'
  'python-tqdm'
  'python-beautifulsoup4'
  'python-requests'
  'python-unidecode')
makedepends=('python-setuptools')
install="spotdl.install"

source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
b2sums=('9c46ae90a26fb09b70ac8e611a8962dcf6a579fb1cfc966b15bf067d47cb7677870996ebb746d965b6d0069fbcf272c3f061077c5cf5d7883898b7a636434135')

build() {
  cd spotdl-$pkgver
  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
