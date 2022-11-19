# Maintainer: Marc Fehling <mafehling.git@gmail.com>
pkgname=('python-sphinx-jupyterbook-latex')
_pkgname=('sphinx-jupyterbook-latex')
pkgver='0.5.2'
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
sha256sums=('14657737a271c9fbd0ba86deb61a14f98b08f481262d7d32b0ec0e3288f71d4c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
