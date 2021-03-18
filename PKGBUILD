# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-mmcif-pdbx
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Python utilities for PDBx/mmCIF storage model"
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD)
depends=('python>=3.6')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name/-/_}-${pkgver}.tar.gz")
sha256sums=('ffd76b08f0215d052fcf3015b8bac927cdf369ca60e4e26974f8aec99ca66986')
options=(!emptydirs)

build() {
    cd "${srcdir}/${_name/-/_}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name/-/_}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

