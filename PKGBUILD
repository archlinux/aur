# Maintainer: crl <crl18039102576@126.com>

pkgname=python-rapids-dependency-file-generator
pkgver=1.20.0
pkgrel=1
pkgdesc="RAPIDSAI Dependency file generator"
url="https://github.com/rapidsai/dependency-file-generator"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-packaging')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bce0036440a1cc6734f0d2197ad118cb6356c288414b3e4d6a62573b33f3254d')


build() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
