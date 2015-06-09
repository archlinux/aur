# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-json-rpc
pkgver=1.9.2
pkgrel=1
pkgdesc="JSON-RPC transport realisation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/pavlov99/json-rpc"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/j/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('bb3b7cfbb94aa26661d1c82052ed5e7f')
sha256sums=('42414af4aeab786bb9643c88238f91253251ce301e5f3cdbf385f778ad9b6399')

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
