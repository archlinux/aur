# Maintainer: mattski <redmattski at gmail dot com>
# Maintainer: Winux <winux@winux.cc>

pkgname=python-audible-cli
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=2
pkgdesc='A command line interface for audible package. With the cli you can download your Audible books, cover, chapter files.'
arch=(any)
url=https://github.com/mkb79/audible-cli
license=(AGPL3)
depends=('python' 'python-aiofiles' 'python-audible' 'python-click' 'python-httpx' 'python-packaging' 'python-pillow' 'python-questionary' 'python-tabulate' 'python-toml' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eb07065c8a8c3992e7eed3b12e18398bfba32fad7e86b99c59f004335a37ba4f')

build() {
    cd $srcdir/${_name}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/${_name}-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
