# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=rssguard
pkgver=3.4.0
pkgrel=1
pkgdesc="A simple (yet powerful) Qt5 feed reader."
arch=('i686' 'x86_64')
url="https://github.com/martinrotter/rssguard/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
optdepends=('mariadb: MySQL/MariaDB storage backend support'
            'qt5-webengine: more feature and support of browsing' )
source=($pkgname-$pkgver.tar.gz::"https://github.com/martinrotter/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5c62e76fe8d3d0fe93234ddced8d97e871c7ff1d9c3cd28da853c8524cad3fd5')


build() {
  cd $pkgname-$pkgver
  qmake-qt5 -r CONFIG+=release PREFIX=/usr INSTALL_ROOT=. QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
}
