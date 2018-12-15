# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=jamulus
_pkgname=Jamulus
pkgver=3.4.3
pkgrel=1
pkgdesc="Internet jam session software"
arch=('i686' 'x86_64')
url='http://llcon.sourceforge.net/'
license=('GPL')
depends=('qt5-base' 'jack')
source=("https://downloads.sourceforge.net/project/llcon/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_pkgname$pkgver"
  qmake Jamulus.pro
  make clean
  make
}

package() {
  cd "$srcdir/$_pkgname$pkgver"
  install -Dm755 Jamulus $pkgdir/usr/bin/jamulus
  install -Dm644 src/res/jamulus.desktop $pkgdir/usr/share/applications/jamulus.desktop
  install -Dm644 src/res/fronticon.png $pkgdir/usr/share/pixmaps/jamulus.png
}

sha1sums=('cc2b82ad2548186036263bc65a436de7dd60588e')
