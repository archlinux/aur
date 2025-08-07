# Maintainer: crl <crl18039102576@126.com>

pkgname=python-rapids-dependency-file-generator
pkgver=1.19.2
pkgrel=1
pkgdesc="RAPIDSAI Dependency file generator"
url="https://github.com/rapidsai/dependency-file-generator"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-packaging')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c23abc8aee23e220a88895496b957f3a33e8de9150fc5a88dd8f1796ab2f8b1')


build() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
