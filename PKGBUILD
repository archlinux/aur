# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pachi
pkgver=12.60
pkgrel=1
pkgdesc="A reasonably strong engine for the board game go" 
arch=('i686' 'x86_64')
depends=('glibc')
url="http://pachi.or.cz/"
license=('GPL')
source=("https://github.com/pasky/pachi/archive/$pkgname-$pkgver.tar.gz" makefile.patch)
sha256sums=('3c05cf4fe5206ba4cbe0e0026ec3225232261b44e9e05e45f76193b4b31ff8e9'
            '19f5d74457d506198ad3ea95ff2fc3c3f9737ed0340f5178b1ba8ebd7fe62fc6')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgname-$pkgver
  patch -Np1 < "$srcdir"/makefile.patch
}

build() {
  cd $pkgname-$pkgname-$pkgver
  make 
}

package() {
    cd $pkgname-$pkgname-$pkgver
    install -d "$pkgdir"/usr/bin
    make PREFIX="$pkgdir"/usr install
}
