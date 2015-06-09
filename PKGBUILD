# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-python-bitcoinlib
pkgver=0.4.0
pkgrel=1
pkgdesc="An easy interface to the Bitcoin protocol and data structures"
arch=('any')
depends=('openssl' 'python')
makedepends=('python-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/petertodd/${pkgname#python-}/tar.gz/${pkgname#python-}-v$pkgver)
sha256sums=('e8594ddfece7a41c74444628dd5ae994684f217e17e96d13f4740d0ec27d2a21')
conflicts=('python-bitcoin' 'python-pybitcointools')

build() {
  cd "$srcdir/${pkgname#python-}-${pkgname#python-}-v$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-${pkgname#python-}-v$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
