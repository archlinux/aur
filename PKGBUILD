# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-jsonrpclib
pkgver=0.1.7
pkgrel=1
pkgdesc="An implementation of the JSON-RPC v2.0 specification (backwards-compatible) as a client library"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/joshmarshall/jsonrpclib/"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/j/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('fb67bd327fbd8b53e62ecbc1c4c6b97d')
sha256sums=('7f50239d53b5e95b94455d5e1adae70592b5b71f0e960d3bbbfbb125788e6f0b')

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
