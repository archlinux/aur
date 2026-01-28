# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=chessx
pkgver=1.6.6
pkgrel=1
pkgdesc="Cross-platform chess database and PGN viewer"
arch=(x86_64)
url=http://chessx.sourceforge.net
license=(GPL-2.0-or-later)
depends=(qt5-multimedia)
makedepends=(qt5-tools qt5-svg qt5-speech)
conflicts=($pkgname-git)
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz")
sha256sums=('3562b62e75038bd7b6df9f2196da43ec7ff0f0f32046a42f93d446cce804a2ea')

build() {
  cd $pkgname-master
  qmake-qt5
  make
}

package() {
  cd $pkgname-master
  install -Dvm644 unix/$pkgname.desktop -t $pkgdir/usr/share/applications/
  install -Dvm644 data/images/$pkgname*.png -t $pkgdir/usr/share/pixmaps/
  install -Dvm755 release/$pkgname -t $pkgdir/usr/bin/
  install -Dvm644 *.md -t $pkgdir/usr/share/doc/$pkgname/
}
