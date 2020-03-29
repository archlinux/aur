# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=jamulus
_pkgname=Jamulus
pkgver=3.4.4
pkgrel=1
pkgdesc="Internet jam session software"
arch=('i686' 'x86_64')
url='http://llcon.sourceforge.net/'
license=('GPL')
depends=('qt5-base' 'jack')
source=("https://downloads.sourceforge.net/project/llcon/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz" "jamulus.desktop")

build() {
  cd "$srcdir/$_pkgname$pkgver"
  qmake Jamulus.pro
  make clean
  make
}

package() {
  cd "$srcdir/$_pkgname$pkgver"
  install -Dm755 Jamulus $pkgdir/usr/bin/jamulus
  install -Dm644 $srcdir/jamulus.desktop $pkgdir/usr/share/applications/jamulus.desktop
  install -Dm644 src/res/fronticon.png $pkgdir/usr/share/pixmaps/jamulus.png
}

sha1sums=('be1ed1c9837be3abc52ecda801a9578495c6277a'
          '2664bf8f2e3226a44e0e12c61371c4441b278d39')
