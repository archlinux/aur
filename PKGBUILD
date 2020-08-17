# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=qjackrcd
pkgver=1.2.3
pkgrel=1
pkgdesc="A simple QT/JACK recorder"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/qjackrcd/"
license=(GPL)
depends=(qt5-base jack)
makedepends=(qt5-tools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/orouits/qjackrcd/archive/v${pkgver}.tar.gz")
sha256sums=('991d637c37342bafa0eb50b29c13bd0ccb00a60f911325ea264bfa417d937ee6')

build() {
  cd "$pkgname-$pkgver"
  qmake PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
