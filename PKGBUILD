# Maintainer: yate <mwyeatts at gmail dot com>
# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.12.2
pkgrel=2
pkgdesc='Python 3 library for communicating with the TREZOR Bitcoin hardware wallet'
arch=('any')
depends=('protobuf'
         'python'
         'python-ecdsa'
         'python-hidapi'
         'python-mnemonic'
         'python-click'
         'python-pyblake2'
         'python-protobuf'
         'python-requests'
         'python-construct'
         'python-libusb1'
         'python-typing_extensions')
makedepends=('python-setuptools')
url='https://github.com/trezor/trezor-firmware/tree/master/python'
license=('LGPL3')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/40/bb/e5aff94fb22fcce0b57dd773b5fd1e8b7bdd16c4bc982755984b9a09bb7d/trezor-0.12.2.tar.gz')
sha256sums=('5bd226b829e5f6ad6c7263f5303f58b54e07b0f21263c4b8ba57981881071264')
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
