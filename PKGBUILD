# Maintainer: Jake <aur@ja-ke.tech>

pkgname=python-ajsonrpc
pkgver=1.2.0
pkgrel=2
pkgdesc="Async JSON-RPC 2.0 protocol + server"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pavlov99/ajsonrpc"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.org/packages/source/a/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
sha256sums=('791bac18f0bf0dee109194644f151cf8b7ff529c4b8d6239ac48104a3251a19f')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
