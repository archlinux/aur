# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=1.2.3
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/ritiek/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-lyricwikia' 'python-yaml' 'python-pathlib' 'youtube-dl' 'python-spotipy' 'python-beautifulsoup4' 'python-logzero' 'python-mutagen' 'python-unicode-slugify' 'python-pafy' 'python-appdirs' 'python-titlecase')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('cddd795e85124d49f9cfd1f80608c0de6a9fe03946c5ed9f6d2ec8b28db50b871cf2e2a1272028fd7a728359a2d0fab0d08fce610188c25c81f68a513b51acbf')

build() {
  cd spotdl-$pkgver
  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

