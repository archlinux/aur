# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_pkgname=httpx-gssapi
pkgname=python-httpx-gssapi
pkgver=0.1.6
pkgrel=1
pkgdesc="GSSAPI (HTTP Negotiate) authentication for Python httpx"
url="https://github.com/pythongssapi/httpx-gssapi"
arch=(any)
license=(custom:ISC)
depends=(python-gssapi python-httpx)
makedepends=(git python-setuptools)
_commit=6efed5e6fa1ac92ed87599cc3271c86281c71904
source=("git+https://github.com/pythongssapi/httpx-gssapi#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et
