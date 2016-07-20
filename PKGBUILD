# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-keepkey
pkgver=0.7.3
pkgrel=2
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
md5sums=('751029603d21879d5e0214f6b4c29a86')
sha256sums=('2c84a9747fb7adea5160bf17ab163b6140e30b5931a9949bb54a48370ab623a9')
provides=('keepkeyctl' 'python2-keepkey')
conflicts=('keepkeyctl')

package() {
  cd "$srcdir/python-keepkey-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
