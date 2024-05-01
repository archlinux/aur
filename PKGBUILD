# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-botoy
_gitname=${pkgname#python-}
pkgver=9.10
pkgrel=1
pkgdesc="OPQ/IOTQQ/IOTBot的一个Python开发助手"
arch=('any')
url="https://github.com/opq-osc/botoy"
license=('MIT')
depends=('python-httpx'
         'python-websockets'
         'python-loguru'
         'python-click'
         'python-prettytable'
         'python-apscheduler'
         'python-pydantic'
         'python-colorama'
         'python-fastapi'
         'uvicorn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xiyaowong/botoy/archive/v${pkgver}.tar.gz")
sha256sums=('f8cfae6e936a6db458b062c899a516f56d40ec5d2ea5090ba63f2d1a822ef36e')

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
