# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=7.1
pkgrel=3
arch=('i686' 'x86_64')
depends=('clutter-gtk')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.net/watsup/watsup.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz")
sha256sums=('eccfab2ebedbf241dd3868c73224bc0ec97f3c3ffbba7eae0487b4809005a8ba')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr 
}

package() { 
  cd $pkgname
  make DESTDIR="$pkgdir" ICONDIR=/usr/share/pixmaps install
  sed -i 's+/usr/share/watsup/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
