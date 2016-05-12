# Maintainer: Michael Straube <m.s.online gmx.de>

pkgname=actiona
pkgver=3.9.1
pkgrel=1
pkgdesc="A task automation tool that allows you to create and execute action lists"
arch=('i686' 'x86_64')
url="https://wiki.actiona.tools"
license=('GPL3')
depends=('qt5-script' 'qt5-xmlpatterns' 'qt5-x11extras' 'qt5-multimedia' 'opencv' 'libnotify')
makedepends=('qt5-tools' 'boost')
source=("https://github.com/Jmgr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('46ddc28a6cc4bb951a1ea4bd65832e7cb2f10d4397e18475bb872c83b5c60188')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt5 -r PREFIX=/usr
  make && make locale_release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
