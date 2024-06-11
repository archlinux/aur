# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=deadbeef-plugin-gui-qt5
pkgver=1.9
_commit=0beb8d40a4e6410ae9ba816a923fa67de4850088
pkgrel=1
pkgdesc="Qt5 plugin for DeaDBeeF"
url="https://github.com/kuba160/ddb_gui_qt5"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('deadbeef' 'qt5-base')
makedepends=('make')
provides=("deadbeef-gui-qt5" "ddb-gui-qt5")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('cee602beb3be3d48259923743bd098ec3a488e8078495f178b01a53884e22f8d')

build() {
  cd ddb_gui_qt5-$_commit
  qmake ddb_gui_qt5.pro
  make
}

package() {
  install -Dm755 ddb_gui_qt5-$_commit/ddb_gui_qt5.so -t "$pkgdir/usr/lib/deadbeef"
}
