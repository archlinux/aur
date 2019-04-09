# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=python-astunparse
_pkgname=astunparse
pkgrel=1
pkgver=1.6.2
pkgdesc="An AST unparser for Python"
depends=('python' 'python-six')
makedepends=('python-setuptools' 'python-wheel')
url="https://github.com/simonpercivall/astunparse"
license=('python')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('ca13543cfcdac7dbfd3ff936c0affbf1')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
