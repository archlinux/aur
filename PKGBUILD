# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-unicorn-binance-local-depth-cache"
_pkgname=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="An unofficial Python API to use the Binance REST API"
arch=('any')
url="https://github.com/LUCIT-Systems-and-Development/$_pkgname"
license=('MIT')
depends=('python-requests' 'python-unicorn-binance-rest-api' 'python-unicorn-binance-websocket-api')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e8c6d1d5c8ae2ff73e13bbef28a16264d3f6f52cad79566b7e79ccad1a9ac246')

build() {
  cd $_pkgname-$pkgver
  rm tools/*
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
