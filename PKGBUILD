#Maintainer: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python-pylibftdi
pkgver=0.17.0
pkgrel=1
pkgdesc="Pythonic interface to FTDI devices using libftdi"
arch=(any)
url="https://github.com/codedstructure/pylibftdi/"
license=('MIT')
depends=('python' 'libftdi')
source=("https://github.com/codedstructure/pylibftdi/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d1da21220fc3ad3f1314d900e2386c5fadcaffa15299ab0b78db2b4b366206f0')

package () {
  cd $srcdir/pylibftdi-$pkgver/
  python ./setup.py install --root=$pkgdir --optimize=1 || return 1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
