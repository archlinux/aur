# Maintainer: jr <jesrui@posteo.net>
# Contributor: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader-qt5
_pkgbase=gimagereader
pkgver=3.2.3
pkgrel=3
pkgdesc="A graphical frontend to tesseract-ocr - Qt5 version"
arch=('x86_64')
url="https://github.com/manisandro/gImageReader"
license=('GPL3')
depends=('hicolor-icon-theme' 'sane' 'podofo' 'tesseract' 'qtspell' 'poppler-qt5')
makedepends=('desktop-file-utils' 'intltool' 'cmake')
conflicts=('gimagereader')
source=(
  "https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${_pkgbase}-${pkgver}.tar.xz"
)
sha256sums=('8ca6b8900671eba7a00fe1f9a728fee6c2ea3ed1ae10cc62dafb0e3f08574420')

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
