# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-pathtools
pkgver=0.1.2
pkgrel=12
pkgdesc="Pattern matching and various utilities for file systems paths"
arch=('any')
url="https://pypi.python.org/pypi/pathtools/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/p/pathtools/pathtools-$pkgver.tar.gz)
sha256sums=('7c35c5421a39bb82e58018febd90e3b6e5db34c5443aaaf742b3f33d4655f1c0')

build() {
  cd "pathtools-$pkgver"
  python setup.py build
}

package() {
  cd "pathtools-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=2:sw=2:et:
