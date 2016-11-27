# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-trezor
pkgver=0.7.8
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
source=(https://pypi.python.org/packages/09/75/2e7da6a88a6305fa4526cdd6123d0669a845bb8fd9b3441a81839eb64142/trezor-0.7.8.tar.gz)
md5sums=('3b44fe3213bcb6fb119e36e2a849a0ba')
sha256sums=('f24caa9d84cdb55c159a6fc858bd6894c6a0502218bf1894b46b1179e2dd86e1')
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
