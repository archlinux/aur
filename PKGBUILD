# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-unicorn-binance-rest-api"
_pkgname=${pkgname#python-}
pkgver=1.4.3
pkgrel=1
pkgdesc="An unofficial Python API to use the Binance REST API"
arch=('any')
url="https://github.com/LUCIT-Systems-and-Development/$_pkgname"
license=('MIT')
depends=('python-requests' 'python-certifi' 'python-colorama' 'python-cryptography' 'python-dateparser' 'python-pyopenssl' 'python-pytz' 'python-service-identity' 'python-ujson')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('beb559ad15f646b3465d3bc3135f388a0dde66d24b3330034c1712ed64b5fe40')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
