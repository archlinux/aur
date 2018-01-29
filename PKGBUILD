# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=qtwebbrowser
pkgver=1.0
pkgrel=2
pkgdesc="Browser for embedded devices developed using the capabilities of Qt and QtWebEngine"
arch=('x86_64')
url="https://code.qt.io/cgit/qt-apps/qtwebbrowser.git"
license=('GPL3')
makedepends=('git')
depends=('qt5-webengine' 'qt5-virtualkeyboard' 'qt5-quickcontrols' 'qt5-graphicaleffects')
source=("git://code.qt.io/qt-apps/$pkgname.git#tag=v$pkgver" "$pkgname.desktop")
md5sums=('SKIP' 'b1fde5cdcb9b7160398a78ecd8d70bf5')

build() {
  cd $pkgname
  qmake-qt5 $pkgname.pro
  make
}

package() {
  install -Dm755 $pkgname/src/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/src/qml/assets/icons/AppLogoColor.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
