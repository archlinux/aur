# Maintainer: Marc Fehling <mafehling.git@gmail.com>
pkgname=('python-jupyterbook-latex')
_pkgname=('jupyterbook-latex')
pkgver='0.3.0'
pkgrel=1
pkgdesc="Supporting LaTeX infrastructure for Jupyter Book."
url="https://github.com/executablebooks/jupyterbook-latex"
depends=('python'
  'python-setuptools'
  'python-sphinx'
  'python-importlib_resources'
)
checkdepends=()
makedepends=()
license=('BSD')
arch=("any")  
source=("${_pkgname}-${pkgver}.tgz::https://github.com/executablebooks/jupyterbook-latex/archive/v${pkgver}.tar.gz")
sha256sums=('0bed369eac3ad7424b4c62282f6cb295715ea0157f1442b9eada974bb00e9bce')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
