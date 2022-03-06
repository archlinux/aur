# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-botoy
_gitname=${pkgname#python-}
pkgver=8.2.0
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
sha256sums=('d281ec61308609a971201f4a70a18f839ad3aa01eb4f0dec1ee76a33e1050523')

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
