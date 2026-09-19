# Maintainer: Siddhesh Dharme <siddheshdharme18@gmail.com>

pkgname=sync-yt
pkgver=2.0.0
pkgrel=1
pkgdesc='CLI tool to mirror YouTube music playlists into local directories'
arch=(any)
url='https://github.com/sdharme/sync-yt'
license=('MIT')
depends=(
    'python>=3.10'
    'yt-dlp'
    'yt-dlp-ejs'
    'nodejs'
    'ffmpeg'
    'python-mutagen'
    'python-curl_cffi'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('1a079ce974be98860160ab5908ff9563b6d8dc37af7666c402aea9e018a674e0f90762f5fbb4b3e3f9d43b592e06fec1b83f2871af78a2ba1800b7dbdcf66f40')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
