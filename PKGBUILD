# Maintainer: crl <crl18039102576@126.com>

pkgname=python-nx-cugraph
pkgver=26.02.00
pkgrel=1
pkgdesc="GPU Accelerated Backend for NetworkX"
url="https://github.com/rapidsai/nx-cugraph"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-pylibcugraph' 'python-cupy' 'python-numpy' 'python-networkx')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('419be0443c6f660767d09d63b85b8ef839270ebf8acfcfd9a20d089824fe4899')


build() {
    cd "$srcdir/nx-cugraph-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/nx-cugraph-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
