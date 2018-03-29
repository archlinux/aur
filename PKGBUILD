# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=4.2
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('xdg-utils')
depends=('libappindicator-gtk3')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.com/watsup"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('56dbb3ab81dc67d07256fd987bc7f314f45309f760c0c8ec4856c217e50159d1')
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
