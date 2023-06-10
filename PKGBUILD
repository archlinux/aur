# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: yate <mwyeatts at gmail dot com>
# Contributor: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
_pkgname=${pkgname#python-}
pkgver=0.13.7
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
         'python-simple-rlp'
         'python-construct-classes'
         'python-protobuf'
         'python-attrs')
optdepends=('python-hidapi: Firmware-less Trezor One setup')
url='https://github.com/trezor/trezor-firmware/tree/master/python'
license=('LGPL3')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('76875e5886017dc94f51bbb411f927f103bd9e3ecbf0754d5e44a353898149e0')
provides=('python-trezor' 'trezorctl')
conflicts=('trezorctl')

build() {
  cd "${pkgname#python-}-$pkgver"

  python setup.py build
}

package() {
  cd "${pkgname#python-}-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
