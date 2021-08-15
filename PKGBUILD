# Maintainer: specter119 <spcter119 AT gmail DOT com>

pkgname=python-perspective
_name=perspective-python
pkgver=0.10.0
pkgrel=1
pkgdesc="Python bindings and JupyterLab integration for Perspective"
url=https://pypi.org/project/$_name
arch=('i686' 'x86_64')
license=('GPL')
depends=(
  python
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
sha512sums=(
  f78d2b1a11b20bfca85939425909972b5ebcd5199f347bb68f28d5e70a3586047e4be132da4af56b2e38320a5085c3eed7c9f161f475f082551544bcca059984)
build() {
  cd $srcdir/${_name}-$pkgver
  python setup.py build
}
package() {
  cd $srcdir/${_name}-$pkgver
  python setup.py install --root $pkgdir --skip-build --optimize=1
  install -Dm644 dist/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
