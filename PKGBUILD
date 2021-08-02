# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Original Contributor: Gareth R <newtackdesign@gmail.com>
# Contributor: Simon K <simon@booya.at>
# Contributor: James Duley <jagduley gmail>

pkgname=xflr5
_revision=1309
pkgver=6.49.r$_revision
pkgrel=2
pkgdesc="An analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://www.xflr5.com/xflr5.htm"
license=('GPL')
depends=('qt5-base')
source=("$pkgname::svn+https://svn.code.sf.net/p/xflr5/code/#revision=$_revision")
sha256sums=('SKIP')


build() {
  cd $pkgname/$pkgname
  
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $pkgname/$pkgname

  make INSTALL_ROOT="$pkgdir" install
}

