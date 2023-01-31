# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_pkgname="bulk-downloader-for-reddit"
pkgname=python-bdfr
pkgver=2.6.2
pkgrel=1
pkgdesc="Bulk downloader for Reddit"
arch=('any')
url="https://github.com/aliparlakci/bulk-downloader-for-reddit"
depends=(
    'python'
    'python-beautifulsoup4'
    'python-dict2xml'
    'python-pip'
    'python-praw'
    'python-yaml'
    'yt-dlp'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
    'python-setuptools'
)
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aliparlakci/bulk-downloader-for-reddit/archive/refs/tags/v2.6.2.tar.gz")
md5sums=("4b63ffa24191328a3e8fdedd28894082")

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
