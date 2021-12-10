# Maintainer: Marc Fehling <mafehling.git@gmail.com>
pkgname=('python-sphinx-jupyterbook-latex')
_pkgname=('sphinx-jupyterbook-latex')
pkgver='0.4.6'
pkgrel=1
pkgdesc="Supporting LaTeX infrastructure for Jupyter Book."
url="https://github.com/executablebooks/sphinx-jupyterbook-latex"
depends=('python'
  'python-setuptools'
  'python-sphinx'
  'python-importlib_resources'
)
checkdepends=()
makedepends=()
license=('BSD')
arch=("any")  
source=("${_pkgname}-${pkgver}.tgz::https://github.com/executablebooks/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('88f299c21de5612a7be9d8c19206014b1554735ba132433356d18b3b5a5893c8')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
