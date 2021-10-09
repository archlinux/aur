# Maintainer: Peter Oehme <oehme.pb (at) gmail (dot) com>

pkgname=python-pymor
_pkgname=pymor
pkgver=2021.1.0
pkgrel=0
pkgdesc="pyMOR is a software library for building model order reduction applications with the Python programming language"
arch=('x86_64')
url="https://www.pymor.org"
license=('custom')
makedepends=(
  'python-setuptools'
  'python-wheel'
  'python-pytest-runner'
  'python-packaging'
)
depends=(
  'python-qtpy'
  'python-diskcache'
  'python-typer'
  'python-click'
  'python-numpy'
  'python-scipy'
)
optdepends=(
  'python-matplotlib: needed for error plots in demo scripts'
  'ipython: an enhanced interactive python shell'
  'python-ipyparallel: required for pymor.parallel.ipython'
  'python-opengl: fast solution visualization for builtin discretizations (PySide also required)'
  'python-pyside: Provides LGPL Qt bindings for Python and related tools for binding generation (Python 3 version)'
  'python-sympy: symbolic mathematics'
  'python-pygments: highlighting code'
  'python-pytest: testing framework required to execute unit tests'
  'pyside2: solution visualization for builtin discretizations'
  'python-ipywidgets: notebook GUI elements'
  'python-pytorch: PyTorch open source machine learning framework'
  'jupyter_contrib_nbextensions: modular collection of jupyter extensions'
  'python-pillow: image library used for bitmap data functions'
  'python-pyevtk'
  'python-xmljson'
  'python-meshio'
  'python-lxml'
  'gmsh'
  'python-sphinx'
  'python-slugify'
  'jupyter-bash_kernel'
  'python-sphinx_materialdesign_theme'
  'python-sphinxcontrib-bibtex'
  'python-sphinx-autoapi'
  'python-myst-nb'
  'python-slycot'
  'python-mpi4py'
)
source=(https://files.pythonhosted.org/packages/f7/d6/af753f253829ff27f84b83b565f670405b23a56328d294fb786960dd5e71/pymor-2021.1.0.tar.gz)
changelog=ChangeLog
sha256sums=('b7a7e8b5e8d3589775180f24b8527e74fd50dc6a9138714d9f322cba90a6999d')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
