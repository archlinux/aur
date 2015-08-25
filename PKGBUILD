# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-keepkey
pkgver=0.6.5
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
md5sums=('2f30040ad6b60b9418e584075b0b4239')
sha256sums=('035ef8bc8c854ab1e69b2e0f244f7a5c191a99b54b036e8865090011f2a6028d')
provides=('keepkeyctl' 'python2-keepkey')
conflicts=('keepkeyctl')

package() {
  cd "$srcdir/python-keepkey-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
