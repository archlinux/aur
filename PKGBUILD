# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.9
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon-qt5' 'qt5-declarative' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/flaviotordini/minitube/archive/$pkgver.tar.gz")
sha256sums=('0f51fb86d0fdfbcf00af142868ceeacb6c27eb8a1e36d856162e23d63e90eb07')

build() {
  cd $pkgname-$pkgver
  qmake
}

package() {
  cd $pkgname-$pkgver
  make install INSTALL_ROOT="$pkgdir/"
}
