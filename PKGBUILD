# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=python-hostlist
pkgdesc="Python module for handling LLNL hostlists"
pkgver=1.20
pkgrel=1
arch=('x86_64')
url="https://www.nsc.liu.se/~kent/python-hostlist/"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://www.nsc.liu.se/~kent/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('1afbf1a2cdebaa527e24ee5c5e85711b')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
