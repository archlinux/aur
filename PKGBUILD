# Maintainer:
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: jddolvin <jddolvin@atheist.com>
# Contributor: arriagga <ramon.arriaga@gmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=musique
pkgver=1.5
pkgrel=1
pkgdesc='A different take on the music player'
arch=('x86_64')
url='https://flavio.tordini.org/musique'
license=('GPL3')
depends=('phonon-qt5' 'taglib' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/flaviotordini/musique/archive/$pkgver.tar.gz")
sha256sums=('82600f4e3d58900df1cc11acd77efbf11e8eac94f8c7382d57f953cadcd49d54')

prepare() {
  mkdir -p build
}

build() {
  cd build
  qmake-qt5 ../$pkgname-$pkgver PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
}
