# Maintainer: crl <crl18039102576@126.com>

pkgname=python-rapids-dependency-file-generator
pkgver=1.18.1
pkgrel=1
pkgdesc="RAPIDSAI Dependency file generator"
url="https://github.com/rapidsai/dependency-file-generator"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-packaging')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ef8118dab8679aec0ff03b2680dd0c5960efb858bd6a2f156f447ea41875069')


build() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
