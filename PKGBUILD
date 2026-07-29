# Maintainer: captience <milkkjello@gmail.com>
pkgname=tide
pkgver=1.2.7
pkgrel=1
pkgdesc="A brutalist multi-source music desktop client"
arch=('any')
url="https://github.com/captiencelovesarch/tide"
license=('GPL-3.0-or-later')
depends=(
  'python>=3.12'
  'pyside6'
  'python-mpv'
  'mpv'
  'yt-dlp'
  'python-ytmusicapi'
  'python-cryptography'
  'python-numpy'
  'python-mutagen'
  'python-spotipy'
  'ttf-ibm-plex'
)
optdepends=(
  'python-pypresence: Discord rich presence integration'
  'python-secretstorage: GNOME/libsecret backend for cookie import'
  'kwallet: KDE wallet backend for cookie import'
  'python-watchdog: live re-indexing of the local files source'
  'librespot: Spotify Premium playback via the librespot backend'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d653f0fb2ec6b40f9859b2fb368062d802222e95b20bf7f2097f0989d4ea9a8')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
