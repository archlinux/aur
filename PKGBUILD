# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-mnemonic
pkgver=0.12
pkgrel=1
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python2' 'python2-pbkdf2')
makedepends=('python2-setuptools')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/m/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('6c30c021309bbd1dced9adeeece82c1d')
sha256sums=('44dab55918f3a97e277e29cabeb1fcb0c32a7a24dc954238c665045236a9b248')

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
