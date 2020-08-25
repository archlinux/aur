# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-propka
_name=${pkgname#python-}
pkgver=3.3.0
pkgrel=1
pkgdesc="Heuristic pKa calculations with ligands"
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD)
depends=('python>=3.6')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2fc79dbd921c2e0db01692dc6775a3a693be6ca7320bd811b03a14a3dda10779')
options=(!emptydirs)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

