# Maintainer: yate <mwyeatts at gmail dot com>
# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.13.0
pkgrel=1
pkgdesc='Python 3 library for communicating with the TREZOR Bitcoin hardware wallet'
arch=('any')
makedepends=('python-setuptools')
depends=('protobuf'
         'python'
         'python-ecdsa'
         'python-mnemonic'
         'python-requests'
         'python-click'
         'python-libusb1'
         'python-construct'
         'python-typing_extensions'
         'python-pyblake2'
         'python-protobuf'
         'python-attrs')
optdepends=('python-hidapi: Firmware-less Trezor One setup')
url='https://github.com/trezor/trezor-firmware/tree/master/python'
license=('LGPL3')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/05/70/276a29016e4321965cd978cc95e735789185e30be3cf46e9fdd7179c1613/trezor-0.13.0.tar.gz')
sha256sums=('4571aa09dbfe88b31eb2f16c7c359b4809621b75a04b7b5bc9dbffe17046c99a')
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
