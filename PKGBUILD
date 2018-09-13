# Maintainer: Samuel Laurén <samuel.lauren@iki.fi>

_name=gssapi
pkgname=python-gssapi
pkgver=1.5.1
pkgrel=1
pkgdesc="Python GSSAPI Wrapper"
arch=(any)
url="https://github.com/pythongssapi/python-gssapi"
license=("custom")
depends=("python" "python-decorator" "python-six" "krb5")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("76c9fda88a7178f41bf6454a06d64054c56b46f0dcbc73307f2e57bb8c25d8cc")

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
