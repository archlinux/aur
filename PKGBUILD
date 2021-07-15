# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-plotly
pkgver=5.1.0
pkgrel=1
pkgdesc="An open-source, interactive graphing library"
url="https://github.com/plotly/plotly.py"
depends=(python
jupyterlab
python-matplotlib
python-numpy
python-six
python-retrying)
optdepends=('ipython' 'python-ipywidgets')
makedepends=(python-setuptools
python-jupyter_core
python-tornado
jupyterlab
npm)
license=('MIT')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plotly/plotly.py/archive/v${pkgver}.tar.gz")
sha256sums=('ed17ece01fc462c5e257567241fda1d202e3cac8c27fa44185bd680bb1457f02')

build() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py build
}

package() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
