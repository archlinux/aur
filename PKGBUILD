# Maintainer: Adam Reichold <adam.reichold@t-online.de>

pkgname=qmediathekview-git
pkgver=r89.0e7fcdb
pkgrel=1
pkgdesc='An alternative front-end to the MediathekView database. (development version)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/adamreichold/QMediathekView'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
optdepends=('vlc: for direct playback of shows')
makedepends=('git' 'qt5-tools' 'rust' 'cargo')
conflicts=('qmediathekview')
source=('git+https://github.com/adamreichold/QMediathekView.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/QMediathekView"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/QMediathekView"

  qmake-qt5
  make
}

package() {
  cd "$srcdir/QMediathekView"

  make "INSTALL_ROOT=$pkgdir" install
}
