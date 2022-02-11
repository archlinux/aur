#Maintainer: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python-pylibftdi
pkgver=0.20.0
pkgrel=1
pkgdesc="Pythonic interface to FTDI devices using libftdi"
arch=(any)
url="https://github.com/codedstructure/pylibftdi/"
license=('MIT')
depends=('python' 'libftdi')
source=("https://github.com/codedstructure/pylibftdi/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('46a18b8573559fb94e3bc90456fa527b1f5ef6b2d629db9b67c9d35f30ab6bb2')

package () {
  cd $srcdir/pylibftdi-$pkgver/
  python ./setup.py install --root=$pkgdir --optimize=1 || return 1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
