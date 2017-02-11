# Maintainer: jr <jesrui@posteo.net>
# Contributor: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader-qt5
_pkgbase=gimagereader
pkgver=3.2.1
pkgrel=1
pkgdesc="A graphical frontend to tesseract-ocr - Qt5 version"
arch=('i686' 'x86_64')
url="https://github.com/manisandro/gImageReader"
license=('GPL3')
depends=('hicolor-icon-theme' 'sane' 'podofo' 'tesseract' 'qtspell' 'poppler-qt5')
makedepends=('desktop-file-utils' 'intltool' 'cmake')
install=${pkgname}.install
source=(
  "https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${_pkgbase}-${pkgver}.tar.xz"
)
sha256sums=('8dc08ca6f36f4c226203fa7fdb2709953d69309dcc78263621231d89d1c1c26e')

build() {
  cd "$_pkgbase-$pkgver"

  mkdir build
  cd build

  cmake -DINTERFACE_TYPE=qt5 -DCMAKE_INSTALL_PREFIX=/usr ..

  make
}

package() {
  cd "$_pkgbase-$pkgver"/build
  make DESTDIR="$pkgdir"/ install
}
