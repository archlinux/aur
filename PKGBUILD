# Maintainer: crl <crl18039102576@126.com>

pkgname=python-nx-cugraph
pkgver=25.12.00
pkgrel=1
pkgdesc="GPU Accelerated Backend for NetworkX"
url="https://github.com/rapidsai/nx-cugraph"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-pylibcugraph' 'python-cupy' 'python-numpy' 'python-networkx')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b10a3a64dcff93f01176feab75badadfaa731945493356e99237c6d1b9682495')


build() {
    cd "$srcdir/nx-cugraph-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/nx-cugraph-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
