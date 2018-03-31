# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>

pkgname=python-forecastio
pkgver=1.4.0
pkgrel=1
pkgdesc="A thin Python Wrapper for the Dark Sky (formerly Forecast.io) weather API"
url="http://zeevgilovitz.com/python-forecast.io"
license=('BSD')
arch=('any')
depends=(
'python'
'python-requests>=1.6'
'python-responses')
makedepends=('python-setuptools')
provides=('python-forecastio')
conflicts=('python-forecastio')
source=(python-forecastio-${pkgver}.tar.gz::https://pypi.python.org/packages/0e/57/e837a44254b7fdf99f3e98ef16ddcc4b429c5b148e8ed4fab4b46e7756ea/python-forecastio-${pkgver}.tar.gz)
sha512sums=('2a8599e1edd2787403042c1a001d214908c9621079ab41c74b543f708a2c52bc24d7132bbcd876aa9303bd1d5f176893034386ff9114c677f7f03de5740603de')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sts=2 sw=2 et ft=PKGBUILD
