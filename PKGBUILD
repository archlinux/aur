# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=2.5
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.net/findwild/findwild.html"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('a62df186000b50f837ecc5d8bd29c61e6ec8403c2582d040c11a4030022d375f')

build() {
  cd $pkgname
  export PREFIX=/usr
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make LDFLAGS="-lpthread" 
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install 
  rm "$pkgdir"/usr/share/doc/$pkgname/$pkgname.man
}

