# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-botoy
_gitname=${pkgname#python-}
pkgver=7.7
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
sha256sums=('4ffb057954ce656e6731a6bdb6fb50c39c43e30e93db8922c8a72d642b50fd7c')

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
