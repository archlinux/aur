# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.3.3
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/spotDL/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-spotipy' 'python-pytube' 'python-rich' 'python-rapidfuzz' 'python-mutagen' 'python-ytmusicapi' 'python-tqdm')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('f8f4f5c98fe105728a0ff8513a09354eaa68a362d42f00c61cd0b7ece475072dac9d46444adeb501b9eba45f5260a1d16e971982539961a6dbc4468c2cca69e2')

build() {
  cd spotdl-$pkgver
  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

