# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-iotbot-git
_gitname=python-iotbot
pkgver=r76.a63ad3c
pkgrel=2
pkgdesc="IOTBOT/IOTQQ SDK with Python."
arch=('any')
url=https://github.com/xiyaowong/python-iotbot
license=('MIT')
depends=('python-socketio'
         'python-websocket-client'
         'python-requests'
         'python-colorama'
         'python-prettytable'
         'python-schedule')
conflicts=('python-iotbot')
provides=('python-iotbot')
source=('git://github.com/XiyaoWong/python-iotbot.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  python setup.py build
}

package() {
  cd $_gitname
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:
