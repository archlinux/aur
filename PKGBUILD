# Maintainer: Justin Dray <justin@dray.be>

pkgname=python-structlog
pkgver=15.1.0
pkgrel=1
pkgdesc="Structured logging for Python"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="http://www.structlog.org"
license=('Apache' 'MIT')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('1017abfe5e8cd292da859368a5d372e8a3c3b4d353cf6fd27cc13cda32f152cb')

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
