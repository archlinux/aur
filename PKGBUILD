# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-trezor
pkgver=0.7.3
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
source=(https://pypi.python.org/packages/31/27/c1bb23ab9fd2477377bc25e3007fcc990544eb5ddb2809552c33f3a527c5/trezor-0.7.3.tar.gz)
md5sums=('8573d0da269cd82313c531e6bc9fc57e')
sha256sums=('91f647826a01ea83689602ddc63c0e7c800930008e2d7b582adbc037c43e9f57')
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
