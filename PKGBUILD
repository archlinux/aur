# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

pkgname=python2-six
pkgver=1.17.0
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities"
arch=('any')
url="https://pypi.org/project/six/"
license=('MIT')
makedepends=('python2' 'python2-setuptools')
checkdepends=('python2-pytest' 'tk')
source=("https://pypi.io/packages/source/s/six/six-$pkgver.tar.gz")
sha512sums=('fcfa58b03877ac3ac00a4f85b5fea4fecb2a010244451aa95013637a0aa21529f3dcfe25c0a07c72da46da1fa12bc0c16b6c641c40c6ab2133e5b5cbb5a71e4b')

build() {
  cd "six-$pkgver"
  python2 setup.py build
}

check() {
  cd "six-$pkgver"
  python2 -m pytest
}

package() {
  cd "six-$pkgver"
  python2 setup.py install --root "$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
