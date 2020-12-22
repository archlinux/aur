# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-ufolib2
_pkgname=ufoLib2
pkgver=0.10.1
pkgrel=1
pkgdesc='A UFO font library'
url='https://github.com/fonttols/ufoLib2'
checkdepends=('python-fs' 'python-pytest')
depends=('python-attrs' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('47cce22f08902af0e65120621fa9a6311fe25a8f0f5c3de32808da9af736e3a4')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=src pytest tests
}
