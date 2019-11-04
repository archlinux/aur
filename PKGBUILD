# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-ufolib2')
_pkgname='ufoLib2'
pkgver='0.4.1'
pkgrel=1
pkgdesc="A UFO font library."
url="https://github.com/fonttols/ufoLib2"
checkdepends=('python-pytest')
depends=('python' 'python-fonttools' 'python-attrs')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('0bde0faa01798639e3ea62c1571985f7862f252d8111d922193508f9148e2921')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-${pkgver}"
    PYTHONPATH=src pytest tests
}
