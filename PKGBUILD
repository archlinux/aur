# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-unicorn-binance-rest-api"
_pkgname=${pkgname#python-}
pkgver=1.4.1
pkgrel=1
pkgdesc="An unofficial Python API to use the Binance REST API"
arch=('any')
url="https://github.com/LUCIT-Systems-and-Development/$_pkgname"
license=('MIT')
depends=('python-requests' 'python-certifi' 'python-colorama' 'python-cryptography' 'python-dateparser' 'python-pyopenssl' 'python-pytz' 'python-service-identity' 'python-ujson')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b709629ab3d077a502590573230b88644bba1a7065c54e02d5854300c9bafd2f')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
