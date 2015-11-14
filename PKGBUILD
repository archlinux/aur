# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-keepkey
pkgver=0.6.7
pkgrel=1
pkgdesc="Python library for communicating with KeepKey Hardware Wallet"
arch=('any')
depends=('protobuf'
         'python2'
         'python2-ecdsa'
         'python2-getch'
         'python2-hidapi'
         'python2-mnemonic'
         'python2-protobuf')
makedepends=('python2-setuptools')
url="https://github.com/keepkey/python-keepkey"
license=('LGPL3')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/keepkey/python-keepkey/tar.gz/v$pkgver)
md5sums=('838262145e5cbadfc55ffbbd31bb6e20')
sha256sums=('b642fac4c801ccb52c83e5791c3eb33ca5d8bb3c87c1e166f187f87dde980d00')
provides=('keepkeyctl' 'python2-keepkey')
conflicts=('keepkeyctl')

package() {
  cd "$srcdir/python-keepkey-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
