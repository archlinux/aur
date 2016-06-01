# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-keepkey
pkgver=0.7.2
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
md5sums=('7b85eed96d1172dfdfc5ca5d75e00f92')
sha256sums=('419b8364cb81f27aa7f4faa56810c7f073ed20f73ef73849d52d300dbc6aba2e')
provides=('keepkeyctl' 'python2-keepkey')
conflicts=('keepkeyctl')

package() {
  cd "$srcdir/python-keepkey-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
