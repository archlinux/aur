# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-keepkey
pkgver=7.2.1
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
source=("https://github.com/keepkey/python-keepkey/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
provides=('keepkeyctl' 'python-keepkey')
conflicts=('keepkeyctl')

package() {
  cd "$srcdir/python-keepkey-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
