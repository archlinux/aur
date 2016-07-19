# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=qtwebbrowser
pkgver=1.0
pkgrel=2
pkgdesc="Browser for embedded devices developed using the capabilities of Qt and Qt WebEngine"
arch=('i686' 'x86_64')
url="http://doc.qt.io/QtWebBrowser"
license=('GPL3')
makedepends=('git')
depends=('qt5-webengine' 'qt5-virtualkeyboard' 'qt5-quickcontrols' 'qt5-graphicaleffects')
source=(git://code.qt.io/qt-apps/$pkgname.git#tag=v$pkgver $pkgname.desktop)
md5sums=('SKIP'
         'b1fde5cdcb9b7160398a78ecd8d70bf5')

build() {
  cd $pkgname
  qmake-qt5 $pkgname.pro
  make
}

package() {
  cd $pkgname/src
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

  install -Dm644 qml/assets/icons/AppLogoColor.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $srcdir/$pkgname.desktop /$pkgdir/usr/share/applications/$pkgname.desktop
}
