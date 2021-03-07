# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
_pkgname=Flask-GSSAPI
pkgname=python-flask-gssapi
pkgver=1.4.0
pkgrel=1
pkgdesc="GSSAPI (HTTP Negotiate) authentication for Flask"
url="https://github.com/cour4g3/flask-gssapi"
arch=(any)
license=(custom:MIT)
depends=(python-flask python-gssapi)
makedepends=(git python-setuptools)
_commit=35e586e8907bc4692c249daa8a6e65c7754906fa
source=("git+https://github.com/cour4g3/flask-gssapi#commit=$_commit")
sha256sums=('SKIP')

#pkgver() {
#  cd flask-gssapi
#  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
#}

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
