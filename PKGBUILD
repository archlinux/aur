# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-plotly
pkgver=4.11.0
pkgrel=1
pkgdesc="An open-source, interactive graphing library"
url="https://github.com/plotly/plotly.py"
depends=('python' 'python-matplotlib' 'python-numpy' 'python-six' 'python-retrying')
optdepends=('ipython' 'python-ipywidgets')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plotly/plotly.py/archive/v${pkgver}.tar.gz")
sha512sums=('813c619859f76f27437f7b66714934acef4495fc589bfcf1167632a069d41e2c85939901714bde25fba20487b18cc60e94eb83713024e75d36df90f3f8c8624f')

build() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py build
}

package() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
