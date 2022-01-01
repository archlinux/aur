# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=5.7
pkgrel=1
arch=('i686' 'x86_64')
depends=('libappindicator-gtk3' 'clutter-gtk')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.net/watsup/watsup.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('860012c0e30fb8892c859cf5e2689bb2db4617a6d554f728dc8b4d5219d76b09')
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
