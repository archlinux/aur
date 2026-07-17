# Maintainer: Zaid Ajo <zaidejjodev@gmail.com>

pkgname=yvid
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern Video Downloader — interactive YouTube search, playlist downloads, smart resume, desktop notifications"
arch=('any')
url="https://github.com/zaidejjo/yvid"
license=('MIT')
depends=(
    'python'
    'yt-dlp'
    'python-rich'
    'python-questionary'
    'python-colorama'
    'python-pillow'
    'python-customtkinter'
    'ffmpeg'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
