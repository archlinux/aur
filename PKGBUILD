# Maintainer: Marc Fehling <mafehling.git@gmail.com>
pkgname=('python-jupyter-book')
_pkgname=('jupyter-book')
pkgver='0.12.2'
pkgrel=1
pkgdesc="Build interactive, publication-quality documents from Jupyter Notebooks."
url="https://github.com/executablebooks/jupyter-book"
depends=('python'
  'python-setuptools'
  'python-click'
  'python-docutils'
  'python-jsonschema'
  'python-jupytext'
  'python-linkify-it-py'
  'python-myst-nb'
  'python-yaml'
  'python-sphinx'
  'python-sphinx-comments'
  'python-sphinx-copybutton'
  'python-sphinx-external-toc'
  'python-sphinx-jupyterbook-latex'
  'python-sphinx-panels'
  'python-sphinx-thebe'
  'python-sphinx-book-theme'
  'python-sphinx-togglebutton'
  'python-sphinxcontrib-bibtex'
  'python-sphinx-multitoc-numbering'
)
checkdepends=()
makedepends=()
license=('BSD')
arch=("any")  
source=("${_pkgname}-${pkgver}.tgz::https://github.com/executablebooks/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f3fccbea1f37098454fc92561593003ab7f12c73aa08612c7984237af2a8cb89')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
