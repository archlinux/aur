# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_pkgname=requests-gssapi
pkgname=python-requests-gssapi
pkgver=1.2.3
pkgrel=1
pkgdesc="GSSAPI (HTTP Negotiate) authentication for Python-Requests"
url="https://github.com/pythongssapi/requests-gssapi"
arch=(any)
license=(custom:ISC)
depends=(python-gssapi python-requests)
makedepends=(git python-setuptools)
_commit=492a4abbbaf8185dad4be09aae9476083ad1ef34
source=("git+https://github.com/pythongssapi/requests-gssapi#commit=$_commit")
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
