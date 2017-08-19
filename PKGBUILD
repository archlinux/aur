# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.8
pkgrel=2
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon-qt5' 'qt5-declarative' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/flaviotordini/minitube/archive/$pkgver.tar.gz")
sha256sums=('c8e7c39d5125027d076440830c6cc33d2782e0d65047d639dfa55e839e64d88c')

build() {
  cd $pkgname-$pkgver
  qmake
}

package() {
  cd $pkgname-$pkgver
  make install INSTALL_ROOT="$pkgdir/"
}
