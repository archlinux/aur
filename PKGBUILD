# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-json-rpc
pkgver=1.13.0
pkgrel=2
pkgdesc="JSON-RPC 1/2 transport implementation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pavlov99/json-rpc"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.org/packages/source/j/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
sha256sums=('def0dbcf5b7084fc31d677f2f5990d988d06497f2f47f13024274cfb2d5d7589')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
