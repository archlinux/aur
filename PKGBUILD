# Maintainer: crl <crl18039102576@126.com>

pkgname=python-nx-cugraph
pkgver=26.06.00
pkgrel=1
pkgdesc="GPU Accelerated Backend for NetworkX"
url="https://github.com/rapidsai/nx-cugraph"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-pylibcugraph' 'python-cupy' 'python-numpy' 'python-networkx')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('18fe45ffed0e71285dc4fb63a0a1784ba6d56f2481457537a25ca2fbb1bd04ac')


build() {
    cd "$srcdir/nx-cugraph-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/nx-cugraph-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
