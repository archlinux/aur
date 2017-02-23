# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-mnemonic
pkgver=0.17
pkgrel=1
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python2' 'python2-pbkdf2')
makedepends=('python2-setuptools')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/73/ef/73f6961373c543b4d23b86de3db653736594907eac88323b20d5c8dece23/mnemonic-0.17.tar.gz)
md5sums=('4d6c66a7322c0316a2b474486fcba734')
sha256sums=('5636ec318c2abb7d1e54b557d1822843d662008099f1588cc3ee2979c8ea06c3')

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
