# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=python-rf24-network
pkgver=1.0.16
pkgrel=0
pkgdesc='Python bindings for networking with RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24Network/'
license=('MIT')
depends=('boost-libs' 'rf24-network' 'python' 'python-rf24')
makedepends=('boost' 'python-setuptools')
source=("https://github.com/nRF24/RF24Network/archive/v${pkgver}.tar.gz")
sha256sums=('698bfa3eee58e1090a7dbd7fedb8630a8f690e75347c01bf5e96dda225a44ed1')

build() {
  cd "$srcdir/RF24Network-$pkgver/RPi/pyRF24Network"
  python setup.py build
}

package() {
  cd "$srcdir/RF24Network-$pkgver/RPi/pyRF24Network"
  python setup.py install --root="$pkgdir/" --optimize=1
}

