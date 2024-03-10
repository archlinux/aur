# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgname=pywapi
pkgname=python-$_pkgname
pkgver=0.3.8
pkgrel=8
pkgdesc='Python wrapper around the Yahoo! Weather, Weather.com and NOAA APIs'
arch=(any)
url=https://launchpad.net/python-weather-api
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz")
sha256sums=('3167e9864a6924870cb674743dc35352379d8af772280dfe2b35a00e940a4588')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
