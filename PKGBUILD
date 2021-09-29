# Maintainer: piernov <piernov@piernov.org>

pkgname=python-bravado-core
pkgver=5.17.0
pkgrel=1
pkgdesc="Python library client-side and server-side support for the OpenAPI Specification v2.0"
arch=('x86_64')
url="https://github.com/Yelp/bravado-core"
license=('BSD')
depends=('python-jsonref' 'python-jsonschema' 'python-dateutil' 'python-yaml' 'python-simplejson' 'python-six' 'python-swagger-spec-validator' 'python-pytz' 'python-msgpack')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yelp/bravado-core/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('9d0a1ba87743af4d013fa65900f5ec8a')

build() {
  cd "$srcdir"/bravado-core-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/bravado-core-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
