# Maintainer: crl <crl18039102576@126.com>

pkgname=python-nx-cugraph
pkgver=26.04.00
pkgrel=1
pkgdesc="GPU Accelerated Backend for NetworkX"
url="https://github.com/rapidsai/nx-cugraph"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-pylibcugraph' 'python-cupy' 'python-numpy' 'python-networkx')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35c4072219cfa50457ae6f1112d0537a52bbc325705cc2d53b18c54e0691ee29')


build() {
    cd "$srcdir/nx-cugraph-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/nx-cugraph-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
