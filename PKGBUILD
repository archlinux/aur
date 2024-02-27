# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_pkgname=httpx-gssapi
pkgname=python-httpx-gssapi
pkgver=0.3.1
pkgrel=1
pkgdesc="GSSAPI (HTTP Negotiate) authentication for Python httpx"
url="https://github.com/pythongssapi/httpx-gssapi"
arch=(any)
license=(custom:ISC)
depends=(python-gssapi python-httpx)
makedepends=(python-build python-installer)
source=("https://github.com/pythongssapi/httpx-gssapi/releases/download/v$pkgver/httpx-gssapi-$pkgver.tar.gz")
sha256sums=('8147fc4898768998c7414553d0b3ffe145ee1d9821df23caac4a8ad8fe9bfea9')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et
