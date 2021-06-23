# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.6.2
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/spotDL/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-spotipy' 'python-pytube' 'python-rich' 'python-rapidfuzz' 'python-mutagen' 'python-ytmusicapi' 'python-tqdm' 'python-beautifulsoup4' 'python-requests' 'python-unidecode')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('6f07453b9a840a2c97599e6350fff1ba63d06daf23d7453d99aba9c502721088ad4f96e59d9120aad959edae13573c1f40cb5c92e1bdb24666eb428a64a3fc6b')

build() {
  cd spotdl-$pkgver

  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

