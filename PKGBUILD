# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-python-bitcoinlib
pkgver=0.7.0
pkgrel=1
pkgdesc="An easy interface to the Bitcoin protocol and data structures"
arch=('any')
depends=('openssl' 'python')
makedepends=('python-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/petertodd/${pkgname#python-}/tar.gz/${pkgname#python-}-v$pkgver)
sha256sums=('ef072c8d168d701c04306f8ce335130b3f44ddd83715a9313ca9770ce2ed7530')
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
