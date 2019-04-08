# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-keepkey
pkgver=6.0.3
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
source=("https://files.pythonhosted.org/packages/d9/e6/d11f9e0214e29869d341df2b352d0c3b417d77e037e4fed25359e492182f/keepkey-6.0.3.tar.gz")
sha256sums=('6d07e4bbaf3b559068775da95ec636d244556a698c6869c16e6913334c056d7c')
provides=('keepkeyctl' 'python-keepkey')
conflicts=('keepkeyctl')

package() {
  cd "$srcdir/keepkey-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
