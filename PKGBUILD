# Maintainer: Peter Oehme <oehme.pb at gmail dot com>
# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=python-pymor
_pkgname=pymor
pkgver=2022.2.1
pkgrel=1
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
source=(https://files.pythonhosted.org/packages/a5/f2/da4f7bcd2bd9d694f0759121ff8b5f15dc273e55363b90166aae41e2c780/pymor-2022.2.1.tar.gz)
changelog=ChangeLog
sha256sums=('538c84d2baf67a6473fb21f1afe7a387cc0c17e9ccb25b8fe83d6ef233b7d697')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
