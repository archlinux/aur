# Maintainer: piernov <piernov@piernov.org>

pkgname=python-swagger-spec-validator
pkgver=3.0.4
pkgrel=2
pkgdesc="Python library that validates Swagger Specs"
arch=('x86_64')
url="https://github.com/Yelp/swagger_spec_validator"
license=('BSD')
depends=('python-jsonschema' 'python-yaml' 'python-typing_extensions' 'python-importlib_resources')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yelp/swagger_spec_validator/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('d5145a629376e11f9dbdfaa35b0f2605')

build() {
  cd "$srcdir"/swagger_spec_validator-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/swagger_spec_validator-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
