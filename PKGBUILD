# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-bitcoinlib
pkgver=0.5.0
pkgrel=1
pkgdesc="An easy interface to the Bitcoin protocol and data structures"
arch=('any')
depends=('openssl' 'python2')
makedepends=('python2-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/petertodd/${pkgname#python2-}/tar.gz/${pkgname#python2-}-v$pkgver)
sha256sums=('8f66ea803b992cd810b221c60fa8a55abc235251ddf8974102850e678cd7fb4d')
conflicts=('python2-bitcoin' 'python2-pybitcointools')

build() {
  cd "$srcdir/${pkgname#python2-}-${pkgname#python2-}-v$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-${pkgname#python2-}-v$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
