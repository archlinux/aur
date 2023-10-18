# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=kleaner
pkgver=1.0
pkgrel=2
pkgdesc='A small utility application for clearing multimedia metadata such as EXIF, IPTC and XMP'
url="https://github.com/najepaliya/kleaner"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('kcoreaddons5' 'ki18n5' 'kirigami2' 'libkexiv2' 'qt5-networkauth' 'qt5-quickcontrols' 'qt5-quickcontrols2')
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  cmake -B build
  cmake --build build
}

package() {
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  make install
}
