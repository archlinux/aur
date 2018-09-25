# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=mozart2-bin
pkgver=2.0.1
pkgrel=3
pkgdesc='Runtime and development environment of Oz'
arch=('x86_64')
url='https://mozart.github.io/'
license=('BSD')
depends=('emacs' 'tk')
conflicts=('mozart2' 'mozart2-compiler')
source=("mozart2-$pkgver-$CARCH-linux.deb::https://sourceforge.net/projects/mozart-oz/files/v$pkgver/mozart2-$pkgver-$CARCH-linux.deb/download"
        "https://raw.githubusercontent.com/mozart/mozart2/master/LICENSE.txt")
md5sums=('f1895fd2ec37a526ef29c278e524da8c'
         '761f3c1b5b9987bc87abc4ca8e6440fa')

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  cp -R usr $pkgdir
}
