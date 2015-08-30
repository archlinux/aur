# Original Contributor: Gareth R <newtackdesign@gmail.com>
# Contributor: Simon K <simon@booya.at>
# Maintainer: James Duley <jagduley gmail>

pkgname=xflr5
pkgver=6.11
pkgrel=1
pkgdesc="An analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://xflr5.sourceforge.net/xflr5.htm"
license=('GPL')
depends=('qt5-base' 'mesa')
makedepends=()
source=("http://download.sourceforge.net/${pkgname}/${pkgname}-${pkgver}_src.tar.gz")
md5sums=('d4f1e6b32741730e8ec27f8192763033')

build() {
  cd "$srcdir/${pkgname}"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make INSTALL_ROOT="$pkgdir" install
}

