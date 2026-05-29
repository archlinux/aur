# Maintainer: mistercookie <mistercookie@archlinux.org>
# Contributor: MCookinho <mistercookie@archlinux.org>

pkgname=hexfeed
pkgver=0.1.0
pkgrel=1
pkgdesc="Anonymous private social network. Tor-native, zero IP leaks, zero trackers."
arch=('any')
url="https://github.com/MCookinho/hexfeed"
license=('MIT')
depends=(
    'python>=3.11'
    'python-fastapi'
    'python-uvicorn'
    'python-textual'
    'python-httpx'
    'python-bcrypt'
    'python-pgpy'
    'python-stem'
    'python-multipart'
    'python-jinja'
)
optdepends=(
    'tor: for .onion hidden service support'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MCookinho/hexfeed/archive/v0.1.0.tar.gz")
sha256sums=('8e8eef4c2853c85bfdb76af996980b587e4e2632f40b50d8282cb8dd34bbfba6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
