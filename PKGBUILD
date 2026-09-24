# Maintainer: crl <crl18039102576@126.com>

pkgname=python-rapids-dependency-file-generator
pkgver=1.22.0
pkgrel=1
pkgdesc="RAPIDSAI Dependency file generator"
url="https://github.com/rapidsai/dependency-file-generator"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-tomlkit' 'python-jsonschema' 'python-pyaml')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c8a9606e6d3d462b77e1710c27b8efbdff3714ff71142ec0d89af38cd544f91c')


build() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
