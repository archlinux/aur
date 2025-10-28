# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=python-rf24-network
pkgver=2.0.5
pkgrel=0
pkgdesc='Python bindings for networking with RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24Network/'
license=('MIT')
depends=('boost-libs' 'rf24-network' 'python' 'python-rf24')
makedepends=('boost' 'python-setuptools')
source=("https://github.com/nRF24/RF24Network/archive/v${pkgver}.tar.gz")
sha256sums=('54a0c34cc0774be36fb63200710ede44468dbdf7109bbe9de35ab073d25e4b70')

build() {
  cd "$srcdir/RF24Network-$pkgver/RPi/pyRF24Network"
  python setup.py build
}

package() {
  cd "$srcdir/RF24Network-$pkgver/RPi/pyRF24Network"
  python setup.py install --root="$pkgdir/" --optimize=1
}

