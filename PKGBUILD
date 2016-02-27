# Original Contributor: Gareth R <newtackdesign@gmail.com>
# Contributor: Simon K <simon@booya.at>
# Maintainer: James Duley <jagduley gmail>

pkgname=xflr5
pkgver=6.12
pkgrel=1
pkgdesc="An analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://xflr5.sourceforge.net/xflr5.htm"
license=('GPL')
depends=('qt5-base')
makedepends=()
source=("http://download.sourceforge.net/${pkgname}/${pkgname}-${pkgver}_src.tar.gz")
md5sums=('80dbf8b7a828c8728c3748a8f4c5ac00')

build() {
  cd "$srcdir/${pkgname}"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make INSTALL_ROOT="$pkgdir" install
}

