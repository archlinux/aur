# Maintainer: Peter Oehme <oehme.pb at gmail dot com>
# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=python-pymor
_pkgname=pymor
pkgver=2021.2.1
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
source=(https://files.pythonhosted.org/packages/26/47/a33c7da3dfb43ff015bfb6762292272e4e7eaae495fc702b30ecf1cd95d2/pymor-2021.2.1.tar.gz)
changelog=ChangeLog
sha256sums=('dc844d24bfba37ca1a010e4dd4eee06e87f896c1850c2821017ab1c9b8eac90e')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
