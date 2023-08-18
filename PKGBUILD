# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pachi
pkgver=12.82
pkgrel=1
pkgdesc="A reasonably strong engine for the board game go"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://pachi.or.cz/"
license=('GPL')
source=("https://github.com/pasky/pachi/archive/$pkgname-$pkgver.tar.gz" makefile.patch)
sha256sums=('1920c3f58b07cb50f7dc38d52485a26990279343119225c6302768840047f507'
            '3a9d02d554f217c245dcae78d181acd99b35b58f22b66248b7768a2eab9dd0dd')
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
