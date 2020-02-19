# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=1.2.4
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/ritiek/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-lyricwikia' 'python-yaml' 'python-pathlib' 'youtube-dl' 'python-spotipy' 'python-beautifulsoup4' 'python-logzero' 'python-mutagen' 'python-unicode-slugify' 'python-pafy' 'python-appdirs' 'python-titlecase')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('aa8bd385464161abca350876ce1356d51319a7f6a14526a209d73519eab7fdbe96cca51266a0171635a2a8de73f1b71627901959f3b2d99729bba05e51309fc6')

build() {
  cd spotdl-$pkgver
  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

