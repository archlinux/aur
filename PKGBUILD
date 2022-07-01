# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=3.3
pkgrel=3
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.net/findwild/findwild.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('03e5a41be96cc6ef8d72f7acf4597507f275445d8383f37c50469e7eb7f6039b')
options=('!emptydirs')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/findwild/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
