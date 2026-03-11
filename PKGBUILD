# Maintainer: crl <crl18039102576@126.com>

pkgname=python-rapids-dependency-file-generator
pkgver=1.20.2
pkgrel=2
pkgdesc="RAPIDSAI Dependency file generator"
url="https://github.com/rapidsai/dependency-file-generator"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-tomlkit' 'python-jsonschema' 'python-pyaml')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4dcb77b9267b30d8e6648e3367c255e37cc575c107d35cf380ba741c06aaf64d')


build() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/dependency-file-generator-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
