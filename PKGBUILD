# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitmerchant
pkgver=0.1.7
pkgrel=1
pkgdesc="Bitcoin/altcoin merchant tools"
arch=('any')
depends=('python' 'python-base58' 'python-ecdsa' 'python-six')
makedepends=('python-setuptools')
url="https://github.com/sbuss/bitmerchant"
license=('MIT')
source=(https://pypi.python.org/packages/source/b/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('2f8af9df299af9d529517ffae91b051d')
sha256sums=('921ca2594c3dffc27e35c04b9197ac94bbecd211fe36bcdc1b567f2194dcd793')

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
