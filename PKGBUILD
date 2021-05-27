# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.6.1
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/spotDL/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-spotipy' 'python-pytube' 'python-rich' 'python-rapidfuzz' 'python-mutagen' 'python-ytmusicapi' 'python-tqdm' 'python-beautifulsoup4' 'python-requests' 'python-unidecode')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('71a6b218d72045063b7cf659a1a04dd5e68ef30abeb7760fca30a7c39e0821f2380dfd659db79f8f86e51602de648eaf963c9786e0e442fc5e1056898edace68')

build() {
  cd spotdl-$pkgver

  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

