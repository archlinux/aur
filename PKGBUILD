# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-ufolib2
_pkgname=ufoLib2
pkgver=0.11.0
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
sha256sums=('1ac5f0c3b7277f2814b2d34f68bf0d23de1abacb67cf94a269fea89a4aa0de19')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=src pytest tests
}
