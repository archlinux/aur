# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=2.0.9
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/ritiek/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-lyricwikia' 'python-yaml' 'python-pathlib' 'youtube-dl' 'python-spotipy' 'python-beautifulsoup4' 'python-logzero' 'python-mutagen' 'python-unicode-slugify' 'python-pafy' 'python-appdirs' 'python-titlecase')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('bbcac1b1206bb1dfcd6a6379509e1ecf411f367b354149a718b274c8525c7ffea987ef4b7d71244a17562b888987e14d5d9f6b615da856e991afec88f69baed6')

build() {
  cd spotdl-$pkgver
  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

