# Maintainer: Zaid Ajo <zaidejjodev@gmail.com>

pkgname=yvid
pkgver=1.1.5
pkgrel=1
pkgdesc="Modern Video Downloader — interactive YouTube search, playlist downloads, smart resume, desktop notifications"
arch=('any')
url="https://github.com/zaidejjo/yvid"
license=('MIT')

# تعريف اسم المجلد كما يظهر في GitHub
_archive="$pkgname-$pkgver"

depends=(
  'python'
  'yt-dlp'
  'python-rich'
  'python-questionary'
  'python-colorama'
  'python-pillow'
  'python-customtkinter'
  'ffmpeg'
  'python-secretstorage'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('77aafe38c668daf7b2cf2c14b97f1d4b224a355a07017c17b5d1af5a5bc76e95')

build() {
  cd "$srcdir/$_archive"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
