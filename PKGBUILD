# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-jsonrpclib
pkgver=0.1.3
pkgrel=1
pkgdesc="An implementation of the JSON-RPC v2.0 specification (backwards-compatible) as a client library"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/joshmarshall/jsonrpclib/"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/j/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b2cc8b86695d5e7c395c9d6908331ecd')
sha256sums=('a594e702c35408ae5540086ab5bdea284fb27d09520898c381c5bbdbfceffbba')

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
