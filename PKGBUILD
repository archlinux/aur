# Maintainer: Specter119 <spcter119 AT gmail DOT com>

pkgname=python-perspective
_name=perspective-python
pkgver=1.0.8
pkgrel=1
pkgdesc="Python bindings and JupyterLab integration for Perspective"
url=https://pypi.org/project/$_name
arch=('i686' 'x86_64')
license=('GPL')
depends=(
  'python>=3.6'
  python-ipywidgets
  python-future
  python-numpy
  python-pandas
  python-dateutil
  python-six
  python-tornado
  python-traitlets)
makedepends=(
  python-setuptools
  cmake
  pybind11
  boost
  flatbuffers
  doxygen)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha512sums=('00ae8e2ae3fa76d7bc6aeb14637e3cb7ee36a3bb40556ffdfcaa0d6d078ac428b40c257cbad4b1285cb5e6266be636a285efaec375a596f912f60904fea36102')
build() {
  cd $srcdir/${_name}-$pkgver
  python setup.py build
}
package() {
  cd $srcdir/${_name}-$pkgver
  python setup.py install --root $pkgdir --skip-build --optimize=1
  install -Dm644 dist/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
