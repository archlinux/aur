# Maintainer: Victor Häggqvist <aur@snilius.com>
# vim: ft=sh

pkgname=mvn-update
pkgver=0.3.1
pkgrel=1
pkgdesc="Maven artifact version updater for build.gradle config files"
url="https://github.com/victorhaggqvist/mvn-update"
arch=('any')
license=('MIT')
depends=('python-lxml' 'python-requests' 'python-semantic-version' 'python-argparse')
source=(https://github.com/victorhaggqvist/$pkgname/archive/v$pkgver.zip)
sha512sums=('8334e6867f83efbad5a25019526fe134dc0dd5f42cb54b6bf9a2b45c1704d24f601b7ab6049654e4c6be1c5b64f928fcc67aef0e908209d0bf97f63ba2871a07')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

