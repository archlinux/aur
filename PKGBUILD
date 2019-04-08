# Maintainer: yate <mwyeatts at gmail dot com>
# Maintainer: Xaiuweb <xaiuweb@protonmail.ch>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-trezor
pkgver=0.11.2
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
         'python-typing-extensions')
makedepends=('python-setuptools')
url='https://github.com/trezor/python-trezor'
license=('LGPL3')
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/42/6a/283786bfb63aacfaa4b82891c906d27880feed32a62692db1fdb36a15b51/trezor-0.11.2.tar.gz')
sha256sums=('a6f4b47b37a21247535fc43411cb70a8c61ef0a5a2dfee668bd05611e2741fb8')
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
