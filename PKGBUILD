# Maintainer: Jerry Lin <jerry73204 at gmail dot com>

pkgname='python-hbmqtt'
pkgver=0.9.6
pkgrel=2
pkgdesc='MQTT client/broker using Python asynchronous I/O'
arch=('x86_64' 'armv7h')
url="https://github.com/beerfactory/hbmqtt"
license=('MIT')
makedepends=('python-setuptools')
depends=(
  'python-transitions'
  'python-websockets'
  'python-passlib'
  'python-docopt'
  'python-yaml'
)
source=("https://github.com/beerfactory/hbmqtt/archive/${pkgver}.tar.gz")
sha256sums=('7232a4f74536ee6aed913af1dfdfb1a9c6372233c6722a610d95e179b0175e53')

_dirname="hbmqtt-${pkgver}"

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --root="$pkgdir" --optimize=1
}
