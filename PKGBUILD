# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=qtwebbrowser
pkgver=1.0
pkgrel=1
pkgdesc="Browser for embedded devices developed using the capabilities of Qt and Qt WebEngine"
arch=('i686' 'x86_64')
url="http://doc.qt.io/QtWebBrowser"
license=('GPL3')
makedepends=('cmake' 'git' 'qt5-webengine')
depends=('qt5-virtualkeyboard' 'qt5-quickcontrols' 'qt5-graphicaleffects')
source=($pkgname-$pkgver::git://code.qt.io/qt-apps/$pkgname.git#tag=v$pkgver)
md5sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  qmake-qt5 $pkgname.pro
  make
}

package() {
  cd $pkgname-$pkgver/src
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
