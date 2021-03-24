# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=python-rf24-network
pkgver=1.0.14
pkgrel=0
pkgdesc='Python bindings for networking with RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24Network/'
license=('MIT')
depends=('boost-libs' 'rf24-network' 'python' 'python-rf24')
makedepends=('boost' 'python-setuptools')
source=("https://github.com/nRF24/RF24Network/archive/v${pkgver}.tar.gz")
sha256sums=('31a719921fa608be8c931574dfe772bc93f0103b21cca00e9ced6a7ad451d92c')

build() {
  cd "$srcdir/RF24Network-$pkgver/RPi/pyRF24Network"
  python setup.py build
}

package() {
  cd "$srcdir/RF24Network-$pkgver/RPi/pyRF24Network"
  python setup.py install --root="$pkgdir/" --optimize=1
}

