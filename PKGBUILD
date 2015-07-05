pkgname=txtorcon
pkgver=0.11.0
pkgrel=1
pkgdesc='A Twisted-based Python asynchronous controller library for Tor'
arch=('any')
url='https://txtorcon.readthedocs.org/'
license=('MIT')
depends=('python2' 'python2-geoip' 'python2-ipaddr' 'twisted')
makedepends=('python2-distribute')
source=("https://github.com/meejah/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('02061b6562777c85263851c5c71855db51dcbc8be438efd451ea810039bae1b7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's:^#!/usr/bin/env python$:\02:' examples/*.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
