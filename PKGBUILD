# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Original Contributor: Gareth R <newtackdesign@gmail.com>
# Contributor: Simon K <simon@booya.at>
# Contributor: James Duley <jagduley gmail>

pkgname=xflr5
pkgver=6.40
pkgrel=1
pkgdesc="An analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://www.xflr5.com/xflr5.htm"
license=('GPL')
depends=('qt5-base')
source=("https://downloads.sourceforge.net/project/xflr5/${pkgver}/xflr5_v${pkgver}_src.tar.gz")
sha256sums=('449199c5a7f69c7370f4728590f27699f58441a124778964b86bdb29b9fd388a')

build() {
  cd "$srcdir/${pkgname}"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make INSTALL_ROOT="$pkgdir" install
  rm -rf "$pkgdir"/usr/lib/
}

