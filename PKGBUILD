# Maintainer: Michael Straube <michael_straube web de>

pkgname=actiona
pkgver=3.9.2
pkgrel=1
pkgdesc="A task automation tool that allows you to create and execute action lists"
arch=('i686' 'x86_64')
url="https://wiki.actiona.tools"
license=('GPL3')
depends=('qt5-script' 'qt5-xmlpatterns' 'qt5-x11extras' 'qt5-multimedia' 'opencv' 'libnotify')
makedepends=('qt5-tools' 'boost')
source=("https://github.com/Jmgr/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('ba01c13e32624d1d61d6e13e036efbf711102c77')

build() {
  cd $pkgname-$pkgver

  qmake-qt5 -r PREFIX=/usr
  make && make locale_release
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="$pkgdir" install
}
