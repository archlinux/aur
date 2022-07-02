# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: stefan husmann <stefan-husmann@t-online.de>

pkgname=picpuz
pkgver=3.4
pkgrel=4
pkgdesc="'jigsaw puzzle' program."
arch=('i686' 'x86_64')
url="http://www.kornelix.net/picpuz/picpuz.html"
license=('GPL3')
depends=('clutter-gtk')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('1f967cd6bca4c256f414c5453379082322c49a4f09b2745d4cf7ad00c83670f2')
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
