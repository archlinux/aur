pkgname=python-orange-timeseries
pkgver=0.3.1
pkgrel=1
pkgdesc="Orange3 add-on for exploring time series and sequential data."
url="https://github.com/biolab/orange3-timeseries"
arch=(any)
license=('CC-BY-NC-3.0')
depends=('python-orange' 'python-statsmodels')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/O/Orange3-Timeseries/Orange3-Timeseries-${pkgver}.tar.gz")
sha1sums=('9943664b2746eeb0d474053ed6b0a79633444848')

build() {
  cd "${srcdir}"/Orange3-Timeseries-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/Orange3-Timeseries-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
