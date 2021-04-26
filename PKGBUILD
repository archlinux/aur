# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-mmcif-pdbx
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Python utilities for PDBx/mmCIF storage model"
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD)
depends=('python>=3.6')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a1f20cf35f92916160ae066f510cce9a0c21a630d064dafce545ba0cf47c9280')
options=(!emptydirs)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

