# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=python-simple-websocket
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple WebSocket server and client for Python."
arch=('any')
url="https://blog.miguelgrinberg.com/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/miguelgrinberg/simple-websocket/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('7c33ee510f3512ba346825d3e678ce243f6c554bb11fc84e9e182a36be20988d')

build() {
#  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd "simple-websocket-${pkgver}"
  python setup.py build
}

package() {
  cd "simple-websocket-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  
  # Install license since the package doesn't include it
  install -Dm 644 "${srcdir}/simple-websocket-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
