# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_pkgname=urllib-gssapi
pkgname=python-urllib-gssapi
pkgver=1.0.1
pkgrel=1
pkgdesc="GSSAPI (HTTP Negotiate) authentication for Python urllib"
url="https://github.com/pythongssapi/urllib-gssapi"
arch=(any)
license=(Apache)
depends=(python-gssapi)
makedepends=(git python-setuptools)
_commit=8d06338a6128366fc695dac508200db6687f53c2
source=("git+https://github.com/pythongssapi/urllib-gssapi#commit=$_commit")
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
