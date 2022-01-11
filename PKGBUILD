# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-teletype
pkgver=1.1.0
pkgrel=2
pkgdesc='Cross-platform Python tty library'
arch=('any')
url='https://github.com/jkwill87/teletype'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/teletype/teletype-$pkgver.tar.gz")
sha256sums=('3e3c770bbcb9abe5f1ad3dbfee1a386e6e385a541c062e0d96141ed72a06af0a')

build() {
  cd "teletype-$pkgver"
  python setup.py build
}

package() {
  export PYTHONHASHSEED=0
  cd "teletype-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ts=2 sw=2 et:
