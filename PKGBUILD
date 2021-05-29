# Maintainer: Marc Fehling <mafehling.git@gmail.com>
pkgname=('python-jupyter-book')
_pkgname=('jupyter-book')
pkgver='0.10.2'
pkgrel=2
pkgdesc="Build interactive, publication-quality documents from Jupyter Notebooks."
url="https://github.com/executablebooks/jupyter-book"
depends=('python'
  'python-setuptools'
  'python-click'
  'python-docutils'
  'python-jsonschema'
  'python-jupyterbook-latex'
  'python-jupytext'
  'python-linkify-it-py'
  'python-myst-nb'
  'jupyter-nbconvert'
  'jupyter-nbformat'
  'python-pyaml'
  'python-sphinx'
  'python-sphinx-comments'
  'python-sphinx-copybutton'
  'python-sphinx-external-toc'
  'python-sphinx-panels'
  'python-sphinx-thebe'
  'python-sphinx-book-theme'
  'python-sphinx-togglebutton'
  'python-sphinxcontrib-bibtex'
  'python-importlib-metadata'
)
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
