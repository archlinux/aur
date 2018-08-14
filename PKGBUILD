# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pachi
pkgver=12.10
_pkgcodename=jowa
pkgrel=1
pkgdesc="A reasonably strong engine for the board game go" 
arch=('i686' 'x86_64')
depends=('glibc')
url="http://pachi.or.cz/"
license=('GPL')
source=("https://github.com/pasky/pachi/archive/$pkgname-$pkgver-$_pkgcodename.tar.gz" makefile.patch)
sha256sums=('0a303f41c5cb87cabd6aa31fc47fd8d2d25eaf142a8c8ab23ecb6663e74df4af'
            '23113ff4493ccb9b63f5a7f9a25f197b6d8aaf538b659acf4b1d124312ccf0bc')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgname-$pkgver-$_pkgcodename
  patch -Np1 < "$srcdir"/makefile.patch
}

build() {
  cd $pkgname-$pkgname-$pkgver-$_pkgcodename
  make 
}

package() {
    cd $pkgname-$pkgname-$pkgver-$_pkgcodename
    install -D -d "$pkgdir"/usr/bin
    make PREFIX="$pkgdir"/usr install
}
