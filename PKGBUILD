# Maintainer: Peter Oehme <oehme.pb at gmail dot com>

pkgname=python-pymor
_pkgname=pymor
pkgver=2023.1.0
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
  'python-build'
  'python-installer'
  'python-hatchling'
)
depends=(
  'python-qtpy'
  'python-typer'
  'python-numpy'
  'python-scipy'
  'python-pygments'
  'python-matplotlib'
  'python-pillow'
)
optdepends=(
  'ipython: an enhanced interactive python shell'
  'python-ipyparallel: required for pymor.parallel.ipython'
  'python-opengl: fast solution visualization for builtin discretizations (PySide also required)'
  'python-pyside: Provides LGPL Qt bindings for Python and related tools for binding generation (Python 3 version)'
  'python-sympy: symbolic mathematics'
  'python-pytest: testing framework required to execute unit tests'
  'pyside2: solution visualization for builtin discretizations'
  'python-ipywidgets: notebook GUI elements'
  'python-pytorch: PyTorch open source machine learning framework'
  'jupyter_contrib_nbextensions: modular collection of jupyter extensions'
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
  'python-docutils'
  'pybind11'
  'python-hypothesis'
  'python-pytest-cov'
  'python-pytest-datadir'
  'ruff'
  'python-hatch'
  'python-ipympl'
  'jupyter-server'
  'qt6-quick3d'
  'python-scikit-fem'
)
source=(https://github.com/pymor/pymor/archive/tags/${pkgver}.tar.gz)
changelog=ChangeLog
sha256sums=('1d4e46c81409a754860812457f3b1f23756300164266ed6d9d7fbddb0f49a71c')

build() {
  echo $(ls)
  cd "${_pkgname}-tags-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-tags-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
