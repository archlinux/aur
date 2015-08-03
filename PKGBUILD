# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitmerchant
pkgver=0.1.6
pkgrel=1
pkgdesc="Bitcoin/altcoin merchant tools"
arch=('any')
depends=('python' 'python-base58' 'python-ecdsa' 'python-six')
makedepends=('python-setuptools')
url="https://pypi.python.org/pypi/bitmerchant"
license=('MIT')
source=(https://pypi.python.org/packages/source/b/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('7a7cb135b0846455fad1b6c38eea0f51')
sha256sums=('2a4aaa4716979d7740be54fdbcea2b3f8c639c9f0e94b40aeb03289f3048cd0b')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
