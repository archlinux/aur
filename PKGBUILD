# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_pkgname=Flask-GSSAPI
pkgname=python-flask-gssapi
pkgver=1.3.1
pkgrel=1
pkgdesc="HTTP Negotiate (GSSAPI) authentication for Flask"
url="https://github.com/cour4g3/flask-gssapi"
arch=(any)
license=(custom:MIT)
depends=(python-flask python-gssapi)
makedepends=(git python-setuptools)
_commit=d3842e14cdf9bf6818d7a154845e951a8e9c058d
source=("git+https://github.com/cour4g3/flask-gssapi#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd flask-gssapi
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

build() {
  cd flask-gssapi
  python setup.py build
}

package() {
  cd flask-gssapi
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et
