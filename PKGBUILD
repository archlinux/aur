# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=duckargs
pkgname=python-duckargs
pkgver=0.1.1
pkgrel=1
pkgdesc="Productivity tool for quickly creating python programs that parse command-line arguments"
arch=(any)
url="https://github.com/eriknyquist/duckargs"
license=('MIT')
depends=('python>=3.7')
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('eb58944256c0373f0e2a07dbc8646b81cb7796d4c9a588ef67409d981433360c06afa5c10135d3648b6be43a4e8f8a3e67cc7c553fe60be8a25d03eb2751ac61')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
