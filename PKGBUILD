# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=oscrypto_tests
pkgname='python-oscrypto-tests'
pkgver=1.3.0
pkgrel=1
pkgdesc="Test suite for oscrypto, separated due to file size"
url="https://pypi.org/project/oscrypto-tests/"
license=('MIT')
arch=('any')
depends=('python-oscrypto')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('40b822bea63e02da2624fee3c252926605c283e8129837e3154a3b3ca53f3c32')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

