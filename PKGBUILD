# Maintainer: yate <mwyeatts at gmail dot com>
# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.13.6
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
source=('https://files.pythonhosted.org/packages/be/56/66b3f66d593e094d79a333ef858e2fee4f188761ed5a07d7e515ee37d928/trezor-0.13.6.tar.gz')
sha256sums=('fc359c07562ff158ae04fd23f6563ac15dc046586f3a6c379536ddef0f790b48')
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
