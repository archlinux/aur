# Maintainer: Samuel Laurén <samuel.lauren@iki.fi>

_name=gssapi
pkgname=python-gssapi
pkgver=1.6.9
pkgrel=1
pkgdesc="Python GSSAPI Wrapper"
arch=(any)
url="https://github.com/pythongssapi/python-gssapi"
license=("custom")
depends=("python" "python-decorator" "krb5")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("0b0aac7138abd3c6d2d8b8400e83933c04a811734456e387e3cb7d59ec4547b9")

build() {
  cd "$srcdir/$_name-$pkgver"

  python3 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  python3 setup.py install -O1 --skip-build --root="${pkgdir}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.xt"
}

# vim:set ts=2 sw=2 et:
