# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-mnemonic
pkgver=0.15
pkgrel=1
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python2' 'python2-pbkdf2')
makedepends=('python2-setuptools')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/d2/07/0d21fc15549dcc916bb6ee3e52d5d18411a1a519d3b44a9ab4b52cabb45f/mnemonic-0.15.tar.gz)
md5sums=('0ec276e73e7d06064ece8127296cbfef')
sha256sums=('4c25f036742602181fa8c2deb5f000c7f2c5c3a169c5dd8af8ce1603dffb2652')

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
