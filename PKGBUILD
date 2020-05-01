# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-ufolib2
_pkgname=ufoLib2
pkgver=0.7.0
pkgrel=1
pkgdesc='A UFO font library'
url='https://github.com/fonttols/ufoLib2'
checkdepends=('python-pytest')
depends=('python' 'python-attrs' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('4d740add44516296b6a9c1a7f82cb4b42f07174d19ba70253e34350cb41d15e0')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-${pkgver}"
    PYTHONPATH=src pytest tests
}
