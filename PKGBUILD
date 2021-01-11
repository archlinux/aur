# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-ufolib2
_pkgname=ufoLib2
pkgver=0.11.1
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
sha256sums=('94f8b1d59c64d41318c7874694c394ea6fc171fd7132b49a4c9b9c66f22f9620')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=src pytest tests
}
