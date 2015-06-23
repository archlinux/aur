# Maintainer: sxe <sxxe@gmx.de>

pkgname=simpletagger
pkgver=0.2.5
pkgrel=3
pkgdesc="A small helper application that lets you tag any of your files."
url="http://opendesktop.org/content/show.php?content=145364"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt4')
makedepends=('qt4' 'automoc4')
source=(http://opendesktop.org/CONTENT/content-files/145364-$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  qmake-qt4 PREFIX="/usr/"
  make clean 
  make

  # Service Menu
  install -D -m 644 ${srcdir}/$pkgname-$pkgver/dolphin/simpletagger.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/simpletagger.desktop

}

package() {
  cd $srcdir/$pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
}
md5sums=('420bd6271110747ccc39097022dfba83')
