# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=python-rf24
pkgver='1.3.1'
pkgrel=0
pkgdesc='Python bindings for RF24 radio modules'
arch=(any)
url='http://tmrh20.github.io/RF24/'
license=('GPL2')
depends=('boost-libs' 'python' 'rf24')
makedepends=('boost' 'python-setuptools')
source=('https://github.com/nRF24/RF24/archive/v1.3.1.tar.gz')
md5sums=('SKIP')

build() {
  cd "$srcdir/RF24-$pkgver"
  ./configure --driver=SPIDEV --prefix="/usr" --ldconfig=''
  cd "$srcdir/RF24-$pkgver/pyRF24"
  python setup.py build
}

package() {
  cd "$srcdir/RF24-$pkgver/pyRF24"
  python setup.py install --root="$pkgdir/" --optimize=1
}

