# Maintainer:

pkgname=python-dbapi-compliance
pkgver=1.15.0
pkgrel=3
pkgdesc='Python DB API 2.0 driver compliance unit test suite'
arch=(any)
url='https://github.com/baztian/dbapi-compliance'
license=('Public domain')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.io/packages/source/d/dbapi-compliance/dbapi-compliance-$pkgver.zip)
sha512sums=('5d1bb34a7e10ec1288fe6d5bdeed6eef0322496810f68b01dbe22e25d9e429c561f53ccddab04b1c9a2b778d0c246d9f9bda56557a5bb81bad8a627e0a0f621e')

build() {
  cd dbapi-compliance-$pkgver
  python setup.py build
}

check() {
  cd dbapi-compliance-$pkgver
  python -m unittest discover -vs .
}

package() {
  cd dbapi-compliance-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
