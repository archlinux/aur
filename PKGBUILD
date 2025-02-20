# Maintainer: redponike <proton (dot) me>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michel Zou

_name=Orange3-Timeseries
pkgname=python-orange-timeseries
pkgver=0.6.3
pkgrel=2
pkgdesc="Orange3 add-on for exploring time series and sequential data."
url="https://github.com/biolab/orange3-timeseries"
arch=(any)
license=('CC-BY-NC-3.0')
depends=('python-orange' 'python-statsmodels' 'python-pyqtgraph')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('504135f946633419d17cadd12f91d1f1a6fb6e080acef349e4da33b8425b2c3c')


build() {
  cd "${_name}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name}-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
