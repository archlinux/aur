# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-python-bitcoinlib
pkgver=0.5.0
pkgrel=1
pkgdesc="An easy interface to the Bitcoin protocol and data structures"
arch=('any')
depends=('openssl' 'python')
makedepends=('python-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/petertodd/${pkgname#python-}/tar.gz/${pkgname#python-}-v$pkgver)
sha256sums=('8f66ea803b992cd810b221c60fa8a55abc235251ddf8974102850e678cd7fb4d')
conflicts=('python-bitcoin' 'python-pybitcointools')

build() {
  cd "$srcdir/${pkgname#python-}-${pkgname#python-}-v$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-${pkgname#python-}-v$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
