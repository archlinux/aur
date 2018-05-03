# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-json-rpc
pkgver=1.11.0
pkgrel=1
pkgdesc="JSON-RPC transport realisation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pavlov99/json-rpc"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.org/packages/source/j/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('c6ec280ce0812df25df3ec9207f2efcd')
sha256sums=('a5e53f80699e97754bfd8a29c86138aa144c4e6663fe80c0be5270fc6f177166')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
