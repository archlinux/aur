# Maintainer: Victor Häggqvist <aur@snilius.com>
# vim: ft=sh

pkgname=mvn-update
pkgver=0.2.1
pkgrel=1
pkgdesc="Maven artifact version updater for build.gradle config files"
url="https://github.com/victorhaggqvist/mvn-update"
arch=('any')
license=('MIT')
depends=('python-lxml' 'python-requests' 'python-semantic-version' 'python-argparse')
source=(https://github.com/victorhaggqvist/$pkgname/archive/v$pkgver.zip)
sha512sums=('c06b5c9f3689a3fb168f83b4ec81ef05fc77316446fc954f8106432dcfc8589eef0470fc7cdb789b2bbb5ce2ac0a33291abb7d5053b2608ac4041fdf38a5cdb8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

