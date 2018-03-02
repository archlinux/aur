# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pachi
pkgver=12.00
_pkgcodename=jowa
pkgrel=1
pkgdesc="A reasonably strong engine for the board game go" 
arch=('i686' 'x86_64')
depends=('glibc')
url="http://pachi.or.cz/"
license=('GPL')
source=("https://github.com/pasky/pachi/archive/$pkgname-$pkgver-$_pkgcodename.tar.gz" makefile.patch)
sha256sums=('d409e939ce8f72f0118febc42039fa1d42548b0324ebdf7e6df1fef9deb15bb2'
            'b58e883f873c0617c89fe12f8dbf0792158baff976456e73cae6a0526236f167')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgname-$pkgver-$_pkgcodename
  patch -Np1 < "$srcdir"/makefile.patch
}

build() {
  cd $pkgname-$pkgname-$pkgver-$_pkgcodename
  make DCNN=0 
}

package() {
    cd $pkgname-$pkgname-$pkgver-$_pkgcodename
    install -D -d "$pkgdir"/usr/bin
    make PREFIX="$pkgdir"/usr install
}
