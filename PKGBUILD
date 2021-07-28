# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.7.0
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/spotDL/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-spotipy' 'python-pytube' 'python-rich' 'python-rapidfuzz' 'python-mutagen' 'python-ytmusicapi' 'python-tqdm' 'python-beautifulsoup4' 'python-requests' 'python-unidecode')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('c2e2a30e0a8f712ca7bb96cf492ec6452f099d1455d807d4648e803990fc5aff3a209deeffc9c248fca4c0556e3182fd00e2c820565ef3fffacd035aa6a49ab3')

build() {
  cd spotdl-$pkgver

  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

