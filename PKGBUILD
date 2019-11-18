# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=python-rf24-network
pkgver='1.0.9'
pkgrel=3
pkgdesc='Python bindings for networking with RF24 radio modules'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://tmrh20.github.io/RF24Network/'
license=('MIT')
depends=('boost-libs' 'rf24-network' 'python' 'python-rf24')
makedepends=('boost' 'python-setuptools')
source=('https://github.com/nRF24/RF24Network/archive/v$pkver.tar.gz')
sha256sums=('1b38748d3b23f04d7ed5cb935eb57441085c6e2d6d51c61e2d2c77a9a227dbc9')

build() {
  cd "$srcdir/RF24Network-$pkver/RPi/pyRF24Network"
  python setup.py build
}

package() {
  cd "$srcdir/RF24Network-$pkver/RPi/pyRF24Network"
  python setup.py install --root="$pkgdir/" --optimize=1
}

