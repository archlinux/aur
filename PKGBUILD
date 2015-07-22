# Maintainer: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader
pkgver=3.1.2
pkgrel=1
pkgdesc="A graphical frontend to tesseract-ocr"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gimagereader/"
license=('GPL3')
#depends=('hicolor-icon-theme' 'sane' 'tesseract' 'gtkspellmm' 'qtspell' 'poppler-qt4')
depends=('hicolor-icon-theme' 'sane' 'tesseract' 'qtspell' 'poppler-qt4')
#makedepends=('gtkmm3' 'desktop-file-utils' 'intltool' 'poppler-glib')
makedepends=('desktop-file-utils' 'intltool')
install=${pkgname}.install
source=(
  "https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
)
sha256sums=('1fbe97554e37902f143c53ad122c0dcb5ca2dcebba53a9f8c8da727cbb0dcaf2')

build() {
  cd "$pkgname-$pkgver"

  mkdir build
  cd build 

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..

  make
}

package() {
  cd "$pkgname-$pkgver"/build
  make DESTDIR="$pkgdir"/ install
}
