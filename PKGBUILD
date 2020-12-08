# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-keepkey
pkgver=6.3.1
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/30/38/558d9a2dd1fd74f50ff4587b4054496ffb69e21ab1138eb448f3e8e2f4a7/keepkey-6.3.1.tar.gz")
sha256sums=('cef1e862e195ece3e42640a0f57d15a63086fd1dedc8b5ddfcbc9c2657f0bb1e')
provides=('keepkeyctl' 'python-keepkey')
conflicts=('keepkeyctl')

package() {
  cd "$srcdir/keepkey-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
