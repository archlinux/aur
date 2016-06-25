# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-trezor
pkgver=0.6.13
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
source=(https://pypi.python.org/packages/09/51/3d4f30e685e9d9247738506a2a7aa436ca829d786eb24b8ea7ab6df51baf/trezor-0.6.13.tar.gz)
md5sums=('5be7cf977e9cd1cf0b6d7317b933dcbf')
sha256sums=('fd4538036bebb12733671c09aac89de38784282c518bdf9ff519e0f72eb75c25')
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
