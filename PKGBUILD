# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-spotdl
pkgver=2.2.2
pkgrel=2
pkgdesc="Download songs from YouTube using Spotify song URLs or playlists with albumart and meta-tags."
arch=('any')
license=('MIT')
url="https://github.com/ritiek/spotify-downloader"
depends=('python-setuptools' 'ffmpeg' 'python-lyricwikia' 'python-yaml' 'python-pathlib' 'youtube-dl' 'python-spotipy' 'python-beautifulsoup4' 'python-logzero' 'python-mutagen' 'python-unicode-slugify' 'python-pafy' 'python-appdirs' 'python-titlecase' 'python-coloredlogs' 'python-pytube' 'python-tqdm')
source=("https://pypi.io/packages/source/s/spotdl/spotdl-$pkgver.tar.gz")
sha512sums=('37003e776e40416eddab8ae8bbfb3e34d9d411482778541681031613292a81a2daa761f4684ee1affdc0b44823ec88ce36d745c3ac4a21d98d9d3cdbac5800f3')

build() {
  cd spotdl-$pkgver
  python setup.py build
}

package() {
  cd spotdl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

