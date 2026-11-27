# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-olca-schema
_name=${pkgname#python-}
pkgver=2.7.0
pkgrel=1
pkgdesc="A package for reading and writing data sets in the openLCA schema format"
arch=('any')
url="https://github.com/GreenDelta/olca-schema"
license=('CC0')
depends=()
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('66c394cbc78b6441b407a7e2c1ed8fa6c15b7218d0b386bf0af4e934f1e32a48')

build() {
    cd ${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name//-/_}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
