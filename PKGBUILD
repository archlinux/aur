# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-trezor
pkgver=0.6.5
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
source=(https://pypi.python.org/packages/source/t/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b19619e82bce7f47a58f7fa91509881b')
sha256sums=('3f1b001cbc58384997b7b406990b6245bce3ac10d8c0d11210780aad42528a17')
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
