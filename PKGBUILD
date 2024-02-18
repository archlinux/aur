pkgname=python-frozen-flask
pkgver=1.0.2
pkgrel=1
pkgdesc='Freezes a Flask application into a set of static files'
url='https://github.com/Frozen-Flask/Frozen-Flask'
license=('BSD')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://github.com/Frozen-Flask/Frozen-Flask/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/Frozen-Flask-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/Frozen-Flask-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('9617817529b5acd38cee284c29c295c0')
sha1sums=('eaa54dd828ea1f002746f2b63338dcb4c371de9d')
sha256sums=('f03c86f63a446153df17c6e6d11d4c1cf712dd5cead1a58b81c6971198e3e228')
sha384sums=('95d7712c35c22f4d4dc05878300678064b74d30de736df8730b94448e959275d8487505919db1b47b7eb8d4a3ac212a8')
sha512sums=('a6b0cce38480fbe1bd898c868a4368009a50367f7500218c8841c5e9756e8f832f68aef44cf17710c3ca5d7f93c3c488a3acb68a68ea056031aaf51afd2a18dc')
