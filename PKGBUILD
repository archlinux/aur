# Maintainer: yate <mwyeatts at gmail dot com>
# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.11.5
pkgrel=1
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
url='https://github.com/trezor/python-trezor'
license=('LGPL3')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/e8/3d/c3792be9b025043ee2b3a08cd97e9617defd3135e084e270a1fba78d1cf8/trezor-0.11.5.tar.gz')
sha256sums=('cd8aafd70a281daa644c4a3fb021ffac20b7a88e86226ecc8bb3e78e1734a184')
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
