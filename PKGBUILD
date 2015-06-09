# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-bitcoinlib
pkgver=0.4.0
pkgrel=1
pkgdesc="An easy interface to the Bitcoin protocol and data structures"
arch=('any')
depends=('openssl' 'python2')
makedepends=('python2-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/petertodd/${pkgname#python2-}/tar.gz/${pkgname#python2-}-v$pkgver)
sha256sums=('e8594ddfece7a41c74444628dd5ae994684f217e17e96d13f4740d0ec27d2a21')
conflicts=('python2-bitcoin' 'python2-pybitcointools')

build() {
  cd "$srcdir/${pkgname#python2-}-${pkgname#python2-}-v$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-${pkgname#python2-}-v$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
