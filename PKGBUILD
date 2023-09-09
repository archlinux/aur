# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=python-simple-websocket
pkgver=0.10.1
pkgrel=1
pkgdesc="Simple WebSocket server and client for Python."
arch=('any')
url="https://blog.miguelgrinberg.com/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-wsproto')
source=("https://github.com/miguelgrinberg/simple-websocket/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('cd76a996651bd2761040948f4732eb5cde23518d25d965d575e7d57a7047245b')

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
