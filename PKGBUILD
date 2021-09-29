# Maintainer: piernov <piernov@piernov.org>

pkgname=python-swagger-spec-validator
pkgver=2.7.3
pkgrel=1
pkgdesc="Python library that validates Swagger Specs"
arch=('x86_64')
url="https://github.com/Yelp/swagger_spec_validator"
license=('BSD')
depends=('python-jsonschema' 'python-yaml' 'python-six')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yelp/swagger_spec_validator/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('1eb4b8c7f316b3579ccee7f468a2fdc6')

build() {
  cd "$srcdir"/swagger_spec_validator-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/swagger_spec_validator-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
