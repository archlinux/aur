# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=3.3
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=('clutter-gtk')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.net/findwild/findwild.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('07e48d44f78e86873a5328b66a0ec01cd3263171f7455ab6b42136199f4933f3')
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
