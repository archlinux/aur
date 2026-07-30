# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-olca-schema
_name=${pkgname#python-}
pkgver=2.6.2
pkgrel=1
pkgdesc="A package for reading and writing data sets in the openLCA schema format"
arch=('any')
url="https://github.com/GreenDelta/olca-schema"
license=('CC0')
depends=()
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('899b29e3658aff8907b3c649fa0e27771b659613a50ce89c7c9672971b15c29f')

build() {
    cd ${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name//-/_}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
