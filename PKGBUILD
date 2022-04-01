# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: stefan husmann <stefan-husmann@t-online.de>

pkgname=picpuz
pkgver=3.4
pkgrel=2
pkgdesc="'jigsaw puzzle' program."
arch=('i686' 'x86_64')
url="http://www.kornelix.net/picpuz/picpuz.html"
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('7862fddd1ba84338ee917e351edc445871e34ef528d3d4992124f17ded790a82')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() { 
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/picpuz/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
