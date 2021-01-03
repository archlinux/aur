# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=qt6gtk2
pkgver=0.1
pkgrel=1
pkgdesc='GTK+2.0 integration plugins for Qt6'
arch=(x86_64)
url='https://github.com/trialuser02/qt6gtk2'
license=(GPL2)
conflicts=($pkgname-git)
depends=(qt6-svg qt6-base gtk2)
makedepends=(qt6-tools)
source=("${pkgname}-$pkgver.tar.gz::${url}/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('8974459b5000d5443847faf833a9ad13d7928fcc8677ed5714e8107b18b18719')

build() {
  cd $pkgname-$pkgver
  /usr/lib/qt6/bin/qmake PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
