# Maintainer: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader
pkgver=3.1.1
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
  "http://sourceforge.net/projects/gimagereader/files/${pkgver}/${pkgname}-${pkgver}.tar.xz"
)
sha256sums=('e37e995cb357cea25698e8aa2932437890957cc24b665b45c2579f5233ee5df6')

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
