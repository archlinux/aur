# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-unicorn-binance-rest-api"
_pkgname=${pkgname#python-}
pkgver=1.4.2
pkgrel=1
pkgdesc="An unofficial Python API to use the Binance REST API"
arch=('any')
url="https://github.com/LUCIT-Systems-and-Development/$_pkgname"
license=('MIT')
depends=('python-requests' 'python-certifi' 'python-colorama' 'python-cryptography' 'python-dateparser' 'python-pyopenssl' 'python-pytz' 'python-service-identity' 'python-ujson')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3357dddd8ddf8d8f3acb255ef3a4510c501200a74b3f886b6bc7b0b4d450c2aa')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
