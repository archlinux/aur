# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-botoy
_gitname=${pkgname#python-}
pkgver=0.0.17
pkgrel=3
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
sha256sums=('76cbf89e7b42f11fee0b3ad92a2093dd2b34d956f18c85510165c377aab8bcac')

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
