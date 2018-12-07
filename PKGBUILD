# Maintainer: Jerry Lin <jerry73204 at gmail dot com>

pkgname=('python-hbmqtt')
pkgver=0.9.5
pkgrel=3
pkgdesc='MQTT client/broker using Python asynchronous I/O'
arch=('x86_64')
url="https://github.com/beerfactory/hbmqtt"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python-transitions' 'python-websockets' 'python-passlib' 'python-docopt' 'python-yaml')
source=("https://github.com/beerfactory/hbmqtt/archive/${pkgver}.tar.gz")
sha256sums=('8afe70008fbe213ae9aff6d66d6db845b41b36d9f89f711657478ec3aa428790')

_dirname="hbmqtt-${pkgver}"

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --root="$pkgdir" --optimize=1
}
