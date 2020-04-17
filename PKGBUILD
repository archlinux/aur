# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-plotly
pkgver=4.6.0
pkgrel=1
pkgdesc="An open-source, interactive graphing library"
url="https://plot.ly/python/"
depends=('python' 'python-matplotlib' 'python-numpy' 'python-six' 'python-retrying')
optdepends=('ipython' 'python-ipywidgets')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/plotly/plotly.py/archive/v${pkgver}.tar.gz")
md5sums=('2da939a7c1d08fb0888c9b3fda135f9f')

build() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py build
}

package() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
