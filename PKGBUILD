# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=python-serde
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=3
pkgdesc='Serde is a lightweight, general-purpose framework for defining, serializing, deserializing, and validating data structures in Python.'
arch=('any')
url='https://pypi.org/project/serde'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel' 'poetry')
provides=('serde')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('5dbbf0910e736d9136a97b8e9b301b76a9f3b19f88d45bc5974b0fc68a5bc3fb')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
