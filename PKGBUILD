# Maintainer: Siddhesh Dharme <siddheshdharme18@gmail.com>

pkgname=sync-yt
pkgver=1.0.1
pkgrel=1
pkgdesc='CLI tool to mirror YouTube playlists into local directories'
arch=(any)
url='https://github.com/sidtronics/sync-yt'
license=('MIT')
depends=(
    'python>=3.10'
    'yt-dlp>=2025.08.27'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('ce8d313f0c6bdf48823afb7dcf9ae1c4208c4ec8333594964f6a528dfc725b88af9b146d03a719b5d106bafdc077d9241c41876ce2915bd1123ff73a52132217')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
