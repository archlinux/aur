# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-json-rpc
pkgver=1.10.1
pkgrel=1
pkgdesc="JSON-RPC transport realisation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pavlov99/json-rpc"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/j/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('04f51d72dd90e3788e91c91c24a4cf2e')
sha256sums=('3edffc0905a08090edb4036f8767a08826ec618f9f02717251fd2eb3e1c6983b')

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
