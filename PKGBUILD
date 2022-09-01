# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup-panel
pkgver=6.0
pkgrel=2
arch=('i686' 'x86_64')
depends=('libappindicator-gtk3' 'clutter-gtk')
license=('GPL3')
pkgdesc="Monitor key Linux system resources using a small report within the top panel."
url="http://www.kornelix.net/watsup/watsup.html"
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('be2463308bdac145d805522b2ddeb6b7d6c285a8734ace5b45aa2fd0cd11b1ea')
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
