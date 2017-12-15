# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>

pkgname=python-forecastio
pkgver=1.3.5
pkgrel=1
pkgdesc="A thin Python Wrapper for the Dark Sky (formerly Forecast.io) weather API"
url="http://zeevgilovitz.com/python-forecast.io"
license=('BSD 2-clause')
arch=('any')
depends=(
'python'
'python-requests'
'python-responses')
makedepends=('python-setuptools')
provides=('python-forecastio')
conflicts=('python-forecastio')
source=(https://pypi.python.org/packages/c4/ee/8db21a142548e4b67950068bd78034b67b04900efa79c44c3c2241a3450c/python-forecastio-${pkgver}.tar.gz)
sha512sums=('389e904921e5cbe62d05f9fd837cc8df0414b187858c4e13487d77b716935092c842d941a49a40b1dd6a91dc795f6d667164964f28c4f35b623be107ea08a409')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ts=2 sts=2 sw=2 et ft=sh
