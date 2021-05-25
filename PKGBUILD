# Maintainer: Tomatopaste <mafehling.git@gmail.com>
pkgname=('python-jupyter-book')
_pkgname=('jupyter-book')
pkgver='0.10.2'
pkgrel=1
pkgdesc="Create books with Jupyter Notebooks and Jekyll."
url="https://github.com/executablebooks/jupyter-book"
depends=('python'
  'python-pytest'
  'python-ruamel-yaml'
  'python-pyaml'
  'python-libsass'
  'python-tqdm'
  'python-setuptools'
  'python-jupytext'
  'jupyter-nbformat'
  'jupyter-nbconvert'
  'python-jupyter_client'
  'python-ipykernel')
checkdepends=()
makedepends=()
license=('BSD')
arch=("any")  
source=("${_pkgname}-${pkgver}.tgz::https://github.com/executablebooks/jupyter-book/archive/v${pkgver}.tar.gz")
sha256sums=('0b48d8244d17371a0e6838598d3485842d5b28a25e745187ad65c164b928b58f')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
