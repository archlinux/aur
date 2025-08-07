# Maintainer: crl <crl18039102576@126.com>

pkgname=python-rapids-build-backend
pkgver=0.4.1
pkgrel=1
pkgdesc="RAPIDS-specific wrapper around PEP 517 build backends"
url="https://github.com/rapidsai/rapids-build-backend"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-rapids-dependency-file-generator')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e026be30491a99a7cc2a1b4ef29778d79bdcebca1ba2ba5b1d7a1353cfb62b0')


build() {
    cd "$srcdir/rapids-build-backend-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/rapids-build-backend-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
