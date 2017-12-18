# Maintainer: minus <minus@mnus.de>

_name=gevent-websocket
pkgname="python-$_name"
pkgver=0.10.1
pkgrel=1
pkgdesc="Websocket handler for the gevent pywsgi server, a Python network library"
url="https://www.gitlab.com/noppo/gevent-websocket"
license=('Apache')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7eaef32968290c9121f7c35b973e2cc302ffb076d018c9068d2f5ca8b2d85fb0')
arch=('any')
depends=(
  'python'
  'python-gevent'
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
