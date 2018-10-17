# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Original Contributor: Gareth R <newtackdesign@gmail.com>
# Contributor: Simon K <simon@booya.at>
# Contributor: James Duley <jagduley gmail>

pkgname=xflr5
pkgver=6.43
pkgrel=1
pkgdesc="An analysis tool for airfoils, wings and planes operating at low Reynolds Numbers."
arch=('i686' 'x86_64')
url="http://www.xflr5.com/xflr5.htm"
license=('GPL')
depends=('qt5-base')
source=("https://downloads.sourceforge.net/project/xflr5/${pkgver}/xflr5_${pkgver}_src.tar.gz")
sha256sums=('81ff2a166b4cc52b5215a54d16b08741b40ed709b1d1d2da9777579689ca01a7')


build() {
  cd $srcdir/$pkgname
  
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $srcdir/$pkgname

  make INSTALL_ROOT="$pkgdir" install
}

