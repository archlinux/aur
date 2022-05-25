# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_pkgname=httpx-gssapi
pkgname=python-httpx-gssapi
pkgver=0.1.7
pkgrel=1
pkgdesc="GSSAPI (HTTP Negotiate) authentication for Python httpx"
url="https://github.com/pythongssapi/httpx-gssapi"
arch=(any)
license=(custom:ISC)
depends=(python-gssapi python-httpx)
makedepends=(python-setuptools)
source=("https://github.com/pythongssapi/httpx-gssapi/releases/download/v$pkgver/httpx-gssapi-$pkgver.tar.gz")
sha256sums=('7bdcbab8725bc15702dd756eec638e36d700e5f534af6f7584ec283c34c8dc69')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et
