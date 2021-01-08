# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=python-typedload
_name=typedload
pkgver=2.4
pkgrel=1
pkgdesc='Load and dump data from json-like format into typed data structures'
arch=('any')
url='https://github.com/ltworf/typedload'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('mypy')
source=("${_name}-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a24131bf859b94cd637be4b9da809fee7b85329e32b9b71f0d204616976b295a')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  make test mypy
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
