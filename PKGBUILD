# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michel Zou

_name=Orange3-Timeseries
pkgname=python-orange-timeseries
pkgver=0.3.3
pkgrel=1
pkgdesc="Orange3 add-on for exploring time series and sequential data."
url="https://github.com/biolab/orange3-timeseries"
arch=(any)
license=('CC-BY-NC-3.0')
depends=('python-orange' 'python-statsmodels')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha1sums=('44fbb80721aaf027dbb1eb7851d81721453c5864')


build() {
  cd "${_name}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name}-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
