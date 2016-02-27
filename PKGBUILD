# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-mnemonic
pkgver=0.13
pkgrel=1
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python2' 'python2-pbkdf2')
makedepends=('python2-setuptools')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/m/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('01576bf55c64e6373f645fc2a79c5280')
sha256sums=('9f58a9eba9995e4342b2b53a945b5cae9fd154aca8e940e0e2be8f61e037e62c')

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
