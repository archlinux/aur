# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=mozart2-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='Runtime and development environment of Oz'
arch=('x86_64')
url='https://mozart.github.io/'
license=('BSD')
depends=('emacs' 'tk')
conflicts=('mozart2' 'mozart2-compiler')
source=("mozart2-$pkgver-$CARCH-linux.rpm::https://sourceforge.net/projects/mozart-oz/files/v${pkgver}/mozart2-${pkgver}-$CARCH-linux.rpm/download"
        "https://raw.githubusercontent.com/mozart/mozart2/master/LICENSE.txt")
md5sums=('26338db686f62a86a36514c922c1f07b'
         '761f3c1b5b9987bc87abc4ca8e6440fa')

prepare() {
  rm -rf usr/lib
}

package() {
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  cp -R usr $pkgdir
}
