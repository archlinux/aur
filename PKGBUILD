# Maintainer: piernov <piernov@piernov.org>

pkgname=python-bravado
pkgver=12.0.1
pkgrel=1
pkgdesc="Python client library for Swagger 2.0 services"
arch=('x86_64')
url="https://github.com/Yelp/bravado"
license=('BSD')
depends=('python-bravado-core' 'python-msgpack' 'python-dateutil' 'python-yaml' 'python-requests' 'python-six' 'python-simplejson' 'python-monotonic' 'python-typing_extensions')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yelp/bravado/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('f17b166e5e1d4cdb849ca095a51dc4ac')

build() {
  cd "$srcdir"/bravado-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/bravado-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
