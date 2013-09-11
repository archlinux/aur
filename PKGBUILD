# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.1
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL')
depends=('phonon')
install="$pkgname.install"
source=("ftp://ftp.archlinux.org/other/community/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
md5sums=('5851cb3e75b39ab7dfbdd45a8ebc6197'
         'SKIP')

build() {
  cd $pkgname-$pkgver
  qmake-qt4
}

package() {
  cd $pkgname-$pkgver
  make install INSTALL_ROOT="$pkgdir/"
}
