# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-plotly
pkgver=4.14.3
pkgrel=1
pkgdesc="An open-source, interactive graphing library"
url="https://github.com/plotly/plotly.py"
depends=('python' 'python-matplotlib' 'python-numpy' 'python-six' 'python-retrying')
optdepends=('ipython' 'python-ipywidgets')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plotly/plotly.py/archive/v${pkgver}.tar.gz")
sha512sums=('8b53a0e15c44d7fdd3bd1968b2c02bdf8816fdeaabd7e636215fc35c60563992de8f34dc0b1901bfd9ae21862b4ff852f0b0bf259d4abbb02cd35c1bf47424dd')

build() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py build
}

package() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
