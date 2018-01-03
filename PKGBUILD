# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.7.16
pkgrel=1
pkgdesc="Python 3 library for communicating with the TREZOR Bitcoin hardware wallet"
arch=('any')
depends=('protobuf'
         'python'
         'python-ecdsa'
         'python-hidapi'
         'python-mnemonic'
         'python-protobuf'
         'python-requests')
makedepends=('python-setuptools')
url="https://github.com/trezor/python-trezor"
license=('LGPL3')
options=(!emptydirs)
source=(https://pypi.python.org/packages/3c/77/aa10c0fd4e8c5112f5b5da23852860acb188802330cb82f27f91f176caa2/trezor-0.7.16.tar.gz)
md5sums=('dd274b1390ee12a3d5d534e25f77a365')
sha256sums=('6bdb69fc125ba705854e21163be6c7da3aa17c2a3a84f40b6d8a3f6e4a8cb314')
provides=('python-trezor' 'trezorctl')
conflicts=('trezorctl')

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
