# Maintainer: yate <mwyeatts at gmail dot com>
# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.12.4
pkgrel=1
pkgdesc='Python 3 library for communicating with the TREZOR Bitcoin hardware wallet'
arch=('any')
makedepends=('python-setuptools')
depends=('protobuf'
         'python'
         'python-ecdsa'
         'python-mnemonic'
         'python-click'
         'python-pyblake2'
         'python-protobuf'
         'python-requests'
         'python-construct'
         'python-libusb1'
         'python-typing_extensions'
         'python-attrs')
optdepends=('python-hidapi: Firmware-less Trezor One setup')
url='https://github.com/trezor/trezor-firmware/tree/master/python'
license=('LGPL3')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/90/4e/d822976f6c043ba5d3e242ddf3ce62967dcceb5936764080e4457388d59c/trezor-0.12.4.tar.gz')
sha256sums=('3e180d9f9f8b69176b5ef36311b6161f5b793b538eb2dfd4babbb4d3fb1e374e')
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
