# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-keepkey
pkgver=6.1.0
pkgrel=1
pkgdesc="Python library for communicating with KeepKey Hardware Wallet"
arch=('any')
depends=('python'
         'python-ecdsa'
         'python-hidapi'
         'python-mnemonic'
         'python-libusb1'
         'python-protobuf')
makedepends=('python-setuptools')
url="https://github.com/keepkey/python-keepkey"
license=('LGPL3')
source=("https://files.pythonhosted.org/packages/61/f7/5487352c4a724fa864c442938b4b44244beaeec34e1d351916611441345f/keepkey-6.1.0.tar.gz")
sha256sums=('2e1623409307c86f709054ad191bc7707c4feeacae2e497bd933f2f0054c6eb0')
provides=('keepkeyctl' 'python-keepkey')
conflicts=('keepkeyctl')

package() {
  cd "$srcdir/keepkey-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
