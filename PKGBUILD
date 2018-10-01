# Maintainer: jr <jesrui@posteo.net>
# Contributor: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader-qt5
_pkgbase=gimagereader
pkgver=3.3.0
pkgrel=1
pkgdesc="A graphical frontend to tesseract-ocr - Qt5 version"
arch=('x86_64')
url="https://github.com/manisandro/gImageReader"
license=('GPL3')
depends=('hicolor-icon-theme' 'sane' 'podofo' 'tesseract' 'qtspell' 'poppler-qt5' 'quazip')
makedepends=('desktop-file-utils' 'intltool' 'cmake')
conflicts=('gimagereader')
source=(
  "https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${_pkgbase}-${pkgver}.tar.xz"
)
sha256sums=('91615af41e89170aadaae68cb0db94eb62abdd5b308e8a5162477ba9baf6efe9')

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
