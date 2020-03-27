# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-ufolib2
_pkgname=ufoLib2
pkgver=0.6.2
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
sha256sums=('7b4f8915eb311eb302a01e7a287cb38df93c2c0baf9b2babc12dad5c1b6f0609')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-${pkgver}"
    PYTHONPATH=src pytest tests
}
