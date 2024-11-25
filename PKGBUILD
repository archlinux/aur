
pkgname=python-humblebundle-downloader
pkgver=0.4.3
pkgrel=2
pkgdesc="Download all of your content from your Humble Bundle Library!"
arch=('x86_64')
url="https://github.com/xtream1101/humblebundle-downloader"
license=('MIT')
makedepends=('python-build' 'python-poetry')
depends=('python' 'python-parsel')
source=("https://github.com/xtream1101/humblebundle-downloader/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1e22ec66353cdc1118824ea0fff1b0e007dc8500554c163e15b3a515ae17d43a')

build() {
    cd humblebundle-downloader-"$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd humblebundle-downloader-"$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
