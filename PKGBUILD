# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-propka
_name=${pkgname#python-}
pkgver=3.5.1
pkgrel=1
pkgdesc="Heuristic pKa calculations with ligands"
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=('LGPL2.1')
depends=('python>=3.8')
checkdepends=('python-numpy' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d8083b58d8c4c553ff8704c706190fe37ff82253adcd6e53b31d8ad7d6d52257')
options=(!emptydirs)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
