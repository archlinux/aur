pkgname=python-krb5
_pkgname=krb5
pkgver=0.1.2
pkgrel=1
pkgdesc="Python krb5 API interface"
url="https://pypi.org/project/krb5/"
arch=('any')
license=('MIT')
depends=('python' 'krb5')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9d8cfafc3db34c8d7ebdb62640b5dbc5342b6892fcad528611da9c258a679cb0')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install -O1 --skip-build --root="$pkgdir"
}

# vim: ts=2:sw=2:et:
