# Maintainer: nezu (aka dumbasPL) <vapciogaming@gmail.com>
pkgname=qmodmaster
pkgver=0.5.2
pkgrel=3
pkgdesc='QModMaster is a free Qt-based implementation of a ModBus master application. A graphical user interface allows easy communication with ModBus RTU and TCP slaves. QModMaster also includes a bus monitor for examining all traffic on the bus.'
arch=('any')
url='https://sourceforge.net/projects/qmodmaster/'

license=('LGPLv3')
depends=('qt5-base')
makedepends=('qt5-tools')

source=("$pkgname-code-$pkgver-$pkgrel.zip::https://sourceforge.net/projects/$pkgname/files/qModMaster-code-$pkgver-$pkgrel.zip/download"
        "$pkgname.desktop")
md5sums=('a6d99220ab398395e40df27f7a6765bb'
         '90ac286373187fbd954b5e12dd477ccf')

build() {
  cd "$srcdir/qModMaster-code-$pkgver-$pkgrel"
  qmake-qt5
  make
}

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname/data/"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/bin"

  cp "$srcdir/qModMaster-code-$pkgver-$pkgrel/qModMaster" "$pkgdir/usr/bin/$pkgname"
  cp "$srcdir/qModMaster-code-$pkgver-$pkgrel/icons/connect-24.png" "$pkgdir/usr/share/$pkgname/data/icon.png"
  cp "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/"
}
