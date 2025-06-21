# Maintainer: Aayush Kumar <aayush214.kumar@gmail.com>
pkgname=python-torrfetch
pkgver=0.1.3
pkgrel=1
pkgdesc="A Python package to fetch torrent metadata from multiple sources"
arch=('any')
url="https://github.com/aayushkdev/torrfetch"
license=('MIT')
depends=('python-aiohttp' 'python-beautifulsoup4' 'python-rapidfuzz')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/aayushkdev/torrfetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/torrfetch-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/torrfetch-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
