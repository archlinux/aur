# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=francis
pkgver=1.0.1
pkgrel=2
pkgdesc='Track your time'
url="https://invent.kde.org/utilities/francis"
arch=('x86_64' 'aarch64')
license=('GPL3-or-later')
depends=('ki18n5' 'kirigami-addons5' 'qt5-networkauth' 'qt5-quickcontrols' 'qt5-svg')
makedepends=('cmake' 'git')
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
  install -Dm644 LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname"
}
