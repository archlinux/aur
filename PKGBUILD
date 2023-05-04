# Maintainer: piernov <piernov@piernov.org>

pkgname=python-bravado-core
pkgver=5.17.1
pkgrel=1
pkgdesc="Python library client-side and server-side support for the OpenAPI Specification v2.0"
arch=('x86_64')
url="https://github.com/Yelp/bravado-core"
license=('BSD')
depends=('python-jsonref' 'python-jsonschema' 'python-dateutil' 'python-yaml' 'python-simplejson' 'python-six' 'python-swagger-spec-validator' 'python-pytz' 'python-msgpack' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yelp/bravado-core/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('5923ba2e359e32bffe12d180ee79f808')

build() {
  cd "$srcdir"/bravado-core-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/bravado-core-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
