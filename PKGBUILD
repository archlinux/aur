# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-botoy
_gitname=${pkgname#python-}
pkgver=0.0.19
pkgrel=1
pkgdesc="OPQ/IOTQQ/IOTBot的一个Python开发助手"
arch=('any')
url="https://github.com/xiyaowong/botoy"
license=('MIT')
depends=('python-httpx'
         'python-socketio4'
         'python-websocket-client'
         'python-prettytable'
         'python-loguru'
         'python-click'
         'python-aiohttp')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xiyaowong/botoy/archive/v${pkgver}.tar.gz")
sha256sums=('88a6a5218bf6829bf8cab8f4a9f21609efe18d5a3e7be3afe1e6909ba261a906')

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
