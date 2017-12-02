# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=actiona
pkgver=3.9.3
pkgrel=1
pkgdesc="A task automation tool that allows you to create and execute action lists"
arch=('x86_64')
url="https://wiki.actiona.tools"
license=('GPL3')
depends=('qt5-script' 'qt5-xmlpatterns' 'qt5-x11extras' 'qt5-multimedia' 'opencv' 'libnotify')
makedepends=('qt5-tools' 'boost')
source=("https://github.com/Jmgr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('91b6a0bbe92cc6776faba8fa726cbd7cf4efb1ae3134739c7bcec5b37b8571c0')

build() {
  cd $pkgname-$pkgver

  qmake-qt5 -r PREFIX=/usr
  make
  make locale_release
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="$pkgdir" install
}
