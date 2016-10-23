# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-trezor
pkgver=0.7.6
pkgrel=1
pkgdesc="Python library for communicating with the TREZOR Bitcoin hardware wallet"
arch=('any')
depends=('protobuf'
         'python2'
         'python2-ecdsa'
         'python2-hidapi'
         'python2-mnemonic'
         'python2-protobuf')
makedepends=('python2-setuptools')
url="https://github.com/trezor/python-trezor"
license=('LGPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/b6/ac/894f90d9d435c26d376559c4b4f08c2e326d5abcadeb4e9b28695228ffb1/trezor-0.7.6.tar.gz)
md5sums=('c0c59a7000b3c121f26923ac9f660dbd')
sha256sums=('3517a507b27dfe28a7b9bc2a62ebcf1fa45797476c8fe0b2e97cb0fccd271c5d')
provides=('trezorctl' 'python2-trezor')
conflicts=('trezorctl')

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
