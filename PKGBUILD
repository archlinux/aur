# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Julien Taverna <jujudusud gmail com>

pkgname=jamulus
_pkgname=Jamulus
pkgver=3.5.5
pkgrel=1
pkgdesc="Internet jam session software"
arch=('x86_64')
url='http://llcon.sourceforge.net/'
license=('GPL')
depends=('qt5-base' 'jack')
source=("https://github.com/corrados/jamulus/archive/r${pkgver//./_}.tar.gz")

build() {
  cd "$srcdir/$pkgname-r${pkgver//./_}"
  qmake Jamulus.pro
  make clean
  make
}

package() {
  cd "$srcdir/$pkgname-r${pkgver//./_}"
  install -Dm755 Jamulus $pkgdir/usr/bin/jamulus
  install -Dm644 distributions/jamulus.desktop $pkgdir/usr/share/applications/jamulus.desktop
  install -Dm644 src/res/fronticon.png $pkgdir/usr/share/pixmaps/jamulus.png
}

sha1sums=('2bb566b8505d418526f61d0672dcb4fd168e5dd3')
