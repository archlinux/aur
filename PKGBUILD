# Maintainer: Jake <aur@ja-ke.tech>

pkgname=python-ajsonrpc
pkgver=1.1.0
pkgrel=1
pkgdesc="Async JSON-RPC 2.0 protocol + server"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pavlov99/ajsonrpc"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.org/packages/source/a/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
sha256sums=('0a01c2b56d20c59868ed96afbc468e0cd73e29b156e2c02c1ed3365e4e42b9ac')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
