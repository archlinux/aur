# Maintainer: Siddhesh Dharme <siddheshdharme18@gmail.com>

pkgname=sync-yt
pkgver=1.1.0
pkgrel=1
pkgdesc='CLI tool to mirror YouTube playlists into local directories'
arch=(any)
url='https://github.com/sidtronics/sync-yt'
license=('MIT')
depends=(
    'python>=3.10'
    'yt-dlp'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('1067780ab78502464e3f8845d66c4d9211f84be29234227ccfeef0f4911ff1abbd4c2c38697c86c5a3744531e942cc5ee0b3260e2fc74e0ad473030ad030be51')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
