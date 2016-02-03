# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-json-rpc
pkgver=1.10.3
pkgrel=1
pkgdesc="JSON-RPC transport realisation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pavlov99/json-rpc"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/j/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('24e9765de545ed2df6f06e229c88a9c8')
sha256sums=('d13e24396ac975ed0ae2f396833dc64148503939b9dff0a7a5ac16918f392585')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
