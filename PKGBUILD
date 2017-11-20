# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-json-rpc
pkgver=1.10.8
pkgrel=1
pkgdesc="JSON-RPC transport realisation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pavlov99/json-rpc"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.org/packages/source/j/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('fa55e8afc1372698bcf210dff89473e3')
sha256sums=('21f04a98d312eaec1b200ea91c147ef6e3b9fc0219aff5bd940e50b6c446d3b5')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
