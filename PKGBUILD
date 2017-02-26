# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pyaes
pkgver=1.6.0
pkgrel=1
pkgdesc="Pure-Python Implementation of the AES block-cipher and common modes of operation"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/ricmoo/pyaes"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/63/31/6768a72cdca5dbd299ae798b690801e6c9c2f018332eec3c5fca79370dba/pyaes-1.6.0.tar.gz)
md5sums=('516d3869e62e661031635270348193fe')
sha256sums=('9cd5a54d914b1eebfb14fcb490315214b6a0304d9f1bb47e90d1d8e0b15ce92e')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
