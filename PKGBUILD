# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-keepkey
pkgver=0.7.1
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
md5sums=('730cc966d2f4dda7703b0081ff38dd1f')
sha256sums=('09a34f8e22f9a62ce137b44ba0f974f137d469fe626f8a080a057cc6d61506d3')
provides=('keepkeyctl' 'python2-keepkey')
conflicts=('keepkeyctl')

package() {
  cd "$srcdir/python-keepkey-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
