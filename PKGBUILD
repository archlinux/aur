# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=python-rf24-network
pkgver=1.0.18
pkgrel=0
pkgdesc='Python bindings for networking with RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24Network/'
license=('MIT')
depends=('boost-libs' 'rf24-network' 'python' 'python-rf24')
makedepends=('boost' 'python-setuptools')
source=("https://github.com/nRF24/RF24Network/archive/v${pkgver}.tar.gz")
sha256sums=('0adf5a1f362f2648b43f5882025f3e319b710cc4830a462c7a44a1eb11f5e807')

build() {
  cd "$srcdir/RF24Network-$pkgver/RPi/pyRF24Network"
  python setup.py build
}

package() {
  cd "$srcdir/RF24Network-$pkgver/RPi/pyRF24Network"
  python setup.py install --root="$pkgdir/" --optimize=1
}

