# Maintainer: robertfoster

pkgname=python-gpsoauth
pkgver='1.0.0'
pkgrel=1
pkgdesc="A python client library for Google Play Services OAuth."
url="https://github.com/simon-weber/gpsoauth"
depends=('python' 'python-requests' 'python-pycryptodomex')
makedepends=('python-build' 'python-installer' 'python-poetry')
license=('MIT')
arch=('any')
source=("${pkgname##python-}-$pkgver.tar.gz::https://github.com/simon-weber/${pkgname##python-}/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname##python-}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname##python-}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('9f8bf74e17c4c42e2c636b6ffdeb20069ed4e468eccb3411c1d680bfdd498b8f')
