# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-jsonrpclib-pelix
pkgver=0.3.1
pkgrel=1
pkgdesc="A Python (2 & 3) JSON-RPC over HTTP that mirrors xmlrpclib syntax"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/tcalmant/jsonrpclib"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/cc/a9/8767fbdaad0e5f53803d5d0e5f5cc778dc1efbabe7f2891e4b95806246b8/jsonrpclib-pelix-0.3.1.tar.gz)
md5sums=('29b501ec629afe8f9cbb88d281e5d155')
sha256sums=('5417b1508d5a50ec64f6e5b88907f111155d52607b218ff3ba9a777afb2e49e3')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
