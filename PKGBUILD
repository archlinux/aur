# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=jamulus
_pkgname=Jamulus
pkgver=3.5.1
pkgrel=1
pkgdesc="Internet jam session software"
arch=('i686' 'x86_64')
url='http://llcon.sourceforge.net/'
license=('GPL')
depends=('qt5-base' 'jack')
source=("https://github.com/corrados/jamulus/archive/r${pkgver//./_}.tar.gz" "jamulus.desktop")

build() {
  cd "$srcdir/$pkgname-r${pkgver//./_}"
  qmake Jamulus.pro
  make clean
  make
}

package() {
  cd "$srcdir/$pkgname-r${pkgver//./_}"
  install -Dm755 Jamulus $pkgdir/usr/bin/jamulus
  install -Dm644 $srcdir/jamulus.desktop $pkgdir/usr/share/applications/jamulus.desktop
  install -Dm644 src/res/fronticon.png $pkgdir/usr/share/pixmaps/jamulus.png
}

sha1sums=('f9015994dd2bfe36f63af7c1eed825136bf2a84e'
          '2664bf8f2e3226a44e0e12c61371c4441b278d39')
