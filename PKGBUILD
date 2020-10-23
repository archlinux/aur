# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=3.1.2
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/spotDL/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-spotipy' 'python-pytube3' 'python-tqdm' 'python-rapidfuzz' 'python-requests' 'python-mutagen')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('40a3d21967566b865fd8838937c72a0b8b4864a02369d4dd907216d529f5d37dcf0a2d0ecf22ea1773f1578369f05e898ce4404be8ac2b5d74dbe2d46f1255a7')

build() {
  cd spotdl-$pkgver
  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

