# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-jsonrpclib
pkgver=0.1.6
pkgrel=1
pkgdesc="An implementation of the JSON-RPC v2.0 specification (backwards-compatible) as a client library"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/joshmarshall/jsonrpclib/"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/j/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('93382cff21aca9074896c9dc1c4ec73d')
sha256sums=('733dad5da783a6ff959927d8c77346273c3b377db43cbdae0bd833b64584cf3a')

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
