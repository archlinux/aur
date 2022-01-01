# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=3.2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.net/findwild/findwild.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('22a9b76a8d749d6d0de8e4fade725005b44a99c81c1a1b0ed7cc923ca4a0c13d')
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
