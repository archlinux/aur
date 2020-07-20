# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=2.2.1
pkgrel=1
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/ritiek/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-lyricwikia' 'python-yaml' 'python-pathlib' 'youtube-dl' 'python-spotipy' 'python-beautifulsoup4' 'python-logzero' 'python-mutagen' 'python-unicode-slugify' 'python-pafy' 'python-appdirs' 'python-titlecase')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('9ca9d8d10669b97dd50563cc630f00180e1741922b38a6d2a19932c296ca3fb3c963327054a953a4d767e8fa894187111dbe6b9ebc287b8fb76c53465d38f672')

build() {
  cd spotdl-$pkgver
  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

