# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-botoy
_gitname=${pkgname#python-}
pkgver=8.2.3
pkgrel=1
pkgdesc="OPQ/IOTQQ/IOTBot的一个Python开发助手"
arch=('any')
url="https://github.com/opq-osc/botoy"
license=('MIT')
depends=('python-httpx'
         'python-socketio4'
         'python-engineio3'
         'python-websocket-client'
         'python-loguru'
         'python-click'
         'python-aiohttp'
         'python-prettytable'
         'python-apscheduler'
         'python-pydantic'
         'python-colorama')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xiyaowong/botoy/archive/v${pkgver}.tar.gz")
sha256sums=('734adc778eb2f5b1407115e0c8317f600461b250f882ff3c2af789fe536955f5')

build() {
  cd ${_gitname}-${pkgver}

  python setup.py build
}

package() {
  cd ${_gitname}-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:
