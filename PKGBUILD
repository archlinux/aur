# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-bitmerchant
pkgver=0.1.8
pkgrel=1
pkgdesc="Bitcoin/altcoin merchant tools"
arch=('any')
depends=('python2'
         'python2-base58'
         'python2-cachetools'
         'python2-ecdsa'
         'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/sbuss/bitmerchant"
license=('MIT')
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('70d175987b137f2728d57ecb277e4786')
sha256sums=('fba4c2091084ed0b4f9faac0ebbba8d255c5ccd3a18e7f877ce13aab71649ddc')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
