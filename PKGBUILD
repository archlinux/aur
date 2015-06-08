# Contributor: nisc <rirae@gmx.net>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=dargui
pkgver=0.7.2
pkgrel=1
pkgdesc="GUI for the backup tool dar (disk archiver)."
arch=('i686')
url="http://dargui.sourceforge.net/"
license="GPL"
depends=('vte' 'gtk2' 'dar' 'xterm' 'at')
source=("http://downloads.sourceforge.net/$pkgname/${pkgname}-${pkgver}-bin.tar.gz")
sha256sums=('a699d5df7e7c6aa151c1c3cbdea54f54e03ccce3f33b622f14c7471795f1559b')

build() {
  cd $srcdir/$pkgname-$pkgver/

  mkdir -p ../../pkg/usr/share/doc/dargui
  mkdir -p ../../pkg/usr/share/man/man1
  mkdir -p ../../pkg/usr/share/dargui/locales
  mkdir    ../../pkg/usr/share/menu
  mkdir    ../../pkg/usr/share/applications
  mkdir    ../../pkg/usr/share/pixmaps
  mkdir    ../../pkg/usr/bin

  cp -vR doc/* ../../pkg/usr/share/doc/dargui/
  cp -v doc/copyright ../../pkg/usr/share/doc/dargui/
  cp -v man/dargui.1.gz ../../pkg/usr/share/man/man1/

  cp -v menu/* ../../pkg/usr/share/menu/
  chmod 644 ../../pkg/usr/share/menu/dargui
  cp -v applications/* ../../pkg/usr/share/applications/
  chmod 644 ../../pkg/usr/share/applications/dargui.desktop
  cp -v pixmaps/* ../../pkg/usr/share/pixmaps/

  cp -v scripts/* ../../pkg/usr/share/dargui/
  cp -v darlogger ../../pkg/usr/share/dargui/

  cp -v locales/* ../../pkg/usr/share/dargui/locales/
  cp -v dargui ../../pkg/usr/bin/
}
