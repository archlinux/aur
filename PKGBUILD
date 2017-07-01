# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mpage
pkgver=2.5.7
pkgrel=2
pkgdesc="Print several pages on a single sheet of paper."
url="http://www.mesa.nl/download.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=("http://www.mesa.nl/pub/mpage/$pkgname-$pkgver.tgz")
md5sums=('8d94338445345a554fd3bc664d48525a')

build() {
  cd $pkgname-$pkgver
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
}


