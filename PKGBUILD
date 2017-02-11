# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-mnemonic
pkgver=0.16
pkgrel=1
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python2' 'python2-pbkdf2')
makedepends=('python2-setuptools')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/bc/2b/4619028d8990af14c14d099b36ac6f88754bc7c421295f3dd9e280752cbf/mnemonic-0.16.tar.gz)
md5sums=('3e9b716da940457557f207b4abbe195b')
sha256sums=('76a1bc2468219a75ece7d1d26e941ad6c01cd589083e698e2c6dcd88c405aef2')

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
