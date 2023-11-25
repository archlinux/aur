# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-botoy
_gitname=${pkgname#python-}
pkgver=9.7
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
sha256sums=('1fa7eda72dca6016a0200dc8a72e24c85fc39dc4b1f6b5199f208bcc0b073d9d')

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
