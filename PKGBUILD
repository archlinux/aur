# Maintainer: piernov <piernov@piernov.org>

pkgname=python-bravado-core
pkgver=6.1.1
_pkgver=6.6.1 # Warning: git tag is wrong, actual version is 6.1.1 but tagged 6.6.1
pkgrel=1
pkgdesc="Python library client-side and server-side support for the OpenAPI Specification v2.0"
arch=('x86_64')
url="https://github.com/Yelp/bravado-core"
license=('BSD')
depends=('python-jsonref' 'python-jsonschema' 'python-dateutil' 'python-yaml' 'python-simplejson' 'python-six' 'python-swagger-spec-validator' 'python-pytz' 'python-msgpack' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yelp/bravado-core/archive/refs/tags/v$_pkgver.tar.gz")
md5sums=('47432f4e80688bf8803a74bf1a855a51')

build() {
  cd "$srcdir"/bravado-core-$_pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/bravado-core-$_pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
