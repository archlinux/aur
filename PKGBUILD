# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-json-rpc
pkgver=1.9.2
pkgrel=1
pkgdesc="JSON-RPC transport realisation"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/pavlov99/json-rpc"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/j/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('bb3b7cfbb94aa26661d1c82052ed5e7f')
sha256sums=('42414af4aeab786bb9643c88238f91253251ce301e5f3cdbf385f778ad9b6399')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
