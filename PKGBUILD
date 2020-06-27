# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=umleditor
pkgver=3.7.3
pkgrel=6
pkgdesc="UML/INTERLIS-Editor"
arch=('any')
url="https://www.interlis.ch/downloads/umleditor/"
license=('LGPL')
depends=('java-runtime' 'interlis-compiler')
makedepends=('unzip')
source=("https://downloads.interlis.ch/$pkgname/$pkgname-$pkgver.zip" "umleditor")

sha512sums=('dda1bafa13163645a36d1aeb89fe882ce375ea4c9e2404e9b1a432bd5cb0faeaf7f6458c56961104bbea71fca9be8b3eb4652f440b45008bad73df80fcbfceb4'
            '2cf66130ca626269f1ea0696c13e8a8189572fe74e542ad53c086e2e9abf24d65011b232f3e0f4607c4f550e8454b622930d00e7d8a8cb6ee05a8f4ebb99aabc')

package() {
  install -d "$pkgdir/opt/$pkgname"
  install -d "$pkgdir/opt/$pkgname/libs"
  cp "$srcdir"/$pkgname-$pkgver.jar "$pkgdir/opt/$pkgname/$pkgname.jar"
  cp -r "$srcdir"/libs/* "$pkgdir/opt/$pkgname/libs"
  install -D -m755 "$srcdir/umleditor" "$pkgdir/usr/bin/umleditor"
}
