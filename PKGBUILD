# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pachi
pkgver=12.50
pkgrel=1
pkgdesc="A reasonably strong engine for the board game go" 
arch=('i686' 'x86_64')
depends=('glibc')
url="http://pachi.or.cz/"
license=('GPL')
source=("https://github.com/pasky/pachi/archive/$pkgname-$pkgver.tar.gz" makefile.patch)
sha256sums=('62c8d44bd4610fe9534a1f21bb092da209c9fb8dcb8d39558d79adabe31e740a'
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
    install -D -d "$pkgdir"/usr/bin
    make PREFIX="$pkgdir"/usr install
}
