# Maintainer: minus <minus@mnus.de>

_name=flask-sockets
pkgname="python-$_name"
pkgver=0.2.1
pkgrel=1
pkgdesc="Elegant WebSockets for your Flask apps. "
url="https://github.com/kennethreitz/flask-sockets"
license=('MIT')
source=("https://github.com/kennethreitz/flask-sockets/archive/v${pkgver}.tar.gz")
sha256sums=('34847325aad2486804ae91677fef6cdd3903ea0db0afbd4f630d9717b3c4a321')
arch=('any')
depends=(
  'python'
  'python-gevent-websocket'
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set et sw=2 sts=2:
