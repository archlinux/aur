# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Original Contributor: Gareth R <newtackdesign@gmail.com>
# Contributor: Simon K <simon@booya.at>
# Contributor: James Duley <jagduley gmail>

pkgname=xflr5
pkgver=6.39
pkgrel=1
pkgdesc="An analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://xflr5.sourceforge.net/xflr5.htm"
license=('GPL')
depends=('qt5-base')
source=("https://downloads.sourceforge.net/project/xflr5/${pkgver}/xflr5_v${pkgver}_src.tar.gz")
sha256sums=('40e2280060d71604c2e6b22fa4b793f8b092118c7702e6e03e05cc3621aa34ed')

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

