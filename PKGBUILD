# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-botoy
_gitname=${pkgname#python-}
pkgver=0.0.16
pkgrel=1
pkgdesc="OPQ/IOTQQ/IOTBot的一个Python开发助手"
arch=('any')
url="https://github.com/xiyaowong/botoy"
license=('MIT')
depends=('python-httpx'
         'python-socketio'
         'python-websocket-client'
         'python-prettytable'
         'python-loguru'
         'python-click'
         'python-aiohttp')
conflicts=("${pkgname}-git")
provides=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xiyaowong/botoy/archive/v${pkgver}.tar.gz")
sha256sums=('5f641f81d1a0f3176965d64236aa5cd6cdfb2a3042907ab1c7237a0137dcdfe5')

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
