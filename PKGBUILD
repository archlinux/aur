# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-unicorn-binance-websocket-api"
_pkgname=${pkgname#python-}
pkgver=1.41.0
pkgrel=1
pkgdesc="An unofficial Python API to use the Binance REST API"
arch=('any')
url="https://github.com/LUCIT-Systems-and-Development/$_pkgname"
license=('MIT')
depends=('python-cheroot' 'python-colorama' 'python-flask' 'python-flask-restful' 'python-psutil' 'python-requests' 'python-ujson' 'python-unicorn-fy' 'python-websocket-client' 'python-websockets')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f10be7d062eccd3213ab2f54f16cfb8ebdb8e293b6a56dfefb89bb9ba41e4b7a')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
