# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_pkgname=httpx_gssapi
pkgname=python-httpx-gssapi
pkgver=0.5
pkgrel=1
pkgdesc="GSSAPI (HTTP Negotiate) authentication for Python httpx"
url="https://github.com/pythongssapi/httpx-gssapi"
arch=(any)
license=(custom:ISC)
depends=(python-gssapi python-httpx)
makedepends=(python-build python-installer)
source=("https://github.com/pythongssapi/httpx-gssapi/releases/download/v$pkgver/httpx_gssapi-$pkgver.tar.gz")
sha256sums=('d1fe7af4c8544303bbb08e5b1bb51d87c5d3b07a1caa6594096660803e40188d')

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
