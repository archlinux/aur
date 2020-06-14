# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-cffsubr'
_pkgname='cffsubr'
pkgver='0.2.7'
pkgrel=1
pkgdesc="Standalone CFF subroutinizer based on AFDKO tx"
url="https://github.com/adobe-type-tools/cffsubr"
checkdepends=('python-pytest')
depends=('python-fonttools')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c30a35d2ffcc2d23826757cba9917884cbdb999760d847c6d83b708ebb80c973')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$_pkgname-$pkgver"
    python setup.py build_ext --inplace
    PYTHONPATH=src pytest tests
}
