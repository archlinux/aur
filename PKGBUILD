# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pachi
pkgver=12.84
pkgrel=1
pkgdesc="A reasonably strong engine for the board game go"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://pachi.or.cz/"
license=('GPL')
source=("https://github.com/pasky/pachi/archive/$pkgname-$pkgver.tar.gz" makefile.patch)
sha256sums=('5ced9ffd9fdb0ee4cdb24ad341abbcb7df0ab8a7f244932b7dd3bfa0ff6180ba'
            'e2cfd2bf317494e602e52075f2577b904c3fcf0ec359556b5f74f4cc17d322ae')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgname-$pkgver
  patch -Np1 < "$srcdir"/makefile.patch
}

build() {
  cd $pkgname-$pkgname-$pkgver
  make DCNN=0
}

package() {
    cd $pkgname-$pkgname-$pkgver
    install -d "$pkgdir"/usr/bin
    make DCNN=0 PREFIX="$pkgdir"/usr install
}
