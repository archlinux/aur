# Maintainer: Siddhesh Dharme <siddheshdharme18@gmail.com>

pkgname=sync-yt
pkgver=2.0.1
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
b2sums=('5c52f3dcdaa877929741cfcd86954b8e6510429052e3e8cecbb03cf138a572651ee70d4e12489b2b8da020015367dd4e7afb464744befc76905796d07255e6dc')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
