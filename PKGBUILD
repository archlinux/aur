# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgname=pywapi
pkgname=python-$_pkgname
pkgver=0.3.8
pkgrel=6
pkgdesc="Python wrapper around the Yahoo! Weather, Weather.com and NOAA APIs"
arch=('any')
#url="http://code.google.com/p/python-weather-api"
url="https://launchpad.net/python-weather-api"
license=('MIT')
makedepends=('python')
source=(https://launchpad.net/python-weather-api/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('75bf8257f32f2d36169d57d92566cdb1')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

