
pkgname=python2-pyasn1-modules
pkgver=0.2.8
pkgrel=4
pkgdesc="A collection of ASN.1-based protocols modules"
arch=('any')
license=('BSD')
url="https://pypi.python.org/pypi/pyasn1-modules"
depends=('python2-pyasn1')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/p/pyasn1-modules/pyasn1-modules-$pkgver.tar.gz")
sha512sums=('fdfcaa065deffdd732deaa1fa30dec2fc4a90ffe15bd12de40636ce0212f447611096d2f4e652ed786b5c47544439e6a93721fabe121f3320f13965692a1ca5b')

build() {
  cd pyasn1-modules-$pkgver
  python2 setup.py build
}

check() {
  cd pyasn1-modules-$pkgver
  PYTHONPATH=. python2 tests/__main__.py
}

package() {
  cd pyasn1-modules-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
