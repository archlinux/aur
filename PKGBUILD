# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pysodium
pkgver=0.6.6
pkgrel=1
pkgdesc="Python wrapper for libsodium"
arch=('any')
depends=('libsodium' 'python2' 'python2-cffi')
makedepends=('python2-setuptools')
url="https://github.com/stef/pysodium"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('efaecb87a9ecb2dc6ea40a22649cf629')
sha256sums=('c06fcd5f741962492e9778f4106131c88d703adbb6448cf60441230e298477c8')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
