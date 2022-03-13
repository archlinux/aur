# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-unicorn-binance-websocket-api"
_pkgname=${pkgname#python-}
pkgver=1.40.5
pkgrel=1
pkgdesc="An unofficial Python API to use the Binance REST API"
arch=('any')
url="https://github.com/LUCIT-Systems-and-Development/$_pkgname"
license=('MIT')
depends=('python-cheroot' 'python-colorama' 'python-flask' 'python-flask-restful' 'python-psutil' 'python-requests' 'python-ujson' 'python-unicorn-fy' 'python-websocket-client' 'python-websockets')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8bc62f5af495608d6cd708c459ce9ef0e4e5ca60639e78f0f2e3998f644a19dc')

build() {
  cd $_pkgname-$pkgver
  rm tools/*
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
