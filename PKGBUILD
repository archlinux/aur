# Original Contributor: Gareth R <newtackdesign@gmail.com>
# Contributor: Simon K <simon@booya.at>
# Maintainer: James Duley <jagduley gmail>

pkgname=xflr5
pkgver=6.10.04
pkgrel=1
pkgdesc="An analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://xflr5.sourceforge.net/xflr5.htm"
license=('GPL')
depends=('qt5-base' 'mesa')
makedepends=()
source=("http://download.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}_src.tar.gz")
md5sums=('1cdbf8c8c941e2387eab74f7f5a27e76')

build() {
  cd "$srcdir/${pkgname}-${pkgver%.*}"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver%.*}"
  make INSTALL_ROOT="$pkgdir" install
}

