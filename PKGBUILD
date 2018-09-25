# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=4.3
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('xdg-utils')
depends=('libappindicator-gtk3')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.com/watsup"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('ba0632b38c2562382c1445a32f6e5af122cf2768b22221f0b66c09f13b4b73ff')
options=('!emptydirs')

build() {
  cd $pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make PREFIX=/usr 
}

package() { 
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR="$pkgdir" install
}
