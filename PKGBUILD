# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=python-mt940
pkgver=0.6.0
pkgrel=1
pkgdesc='Module to parse MT940 files'
arch=('any')
url="https://pypi.python.org/pypi/mt940"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/mt940/mt940-$pkgver.tar.gz")
sha512sums=('b13f2006181f8636f1b7ca555fb5650c62dcb76a942c837ef710599e69916d39c8d8d6e1f6781b1f40920bb9d5c7222e7272f19a68dee5f280db27e092eb896e')

build() {
  cd "mt940-$pkgver"
  python setup.py build
}

check() {
  cd "mt940-$pkgver"
  python setup.py test
}

package() {
  cd "mt940-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
