# Maintainer: crl <crl18039102576@126.com>

pkgname=python-rapids-build-backend
pkgver=0.3.4
pkgrel=1
pkgdesc="RAPIDS-specific wrapper around PEP 517 build backends"
url="https://github.com/rapidsai/rapids-build-backend"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-rapids-dependency-file-generator')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2342301ea6634c1e6c1989641693c0f48f0dbc92ec40e3c703cf3e75d233ff55')


build() {
    cd "$srcdir/rapids-build-backend-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/rapids-build-backend-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
