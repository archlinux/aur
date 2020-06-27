# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=umleditor
pkgver=3.7.3
pkgrel=5
pkgdesc="UML/INTERLIS-Editor"
arch=('any')
url="https://www.interlis.ch/downloads/umleditor/"
license=('LGPL')
depends=('java-runtime' 'interlis-compiler')
makedepends=('unzip')
source=("https://downloads.interlis.ch/$pkgname/$pkgname-$pkgver.zip" "umleditor")

sha512sums=('dda1bafa13163645a36d1aeb89fe882ce375ea4c9e2404e9b1a432bd5cb0faeaf7f6458c56961104bbea71fca9be8b3eb4652f440b45008bad73df80fcbfceb4'
            '82f9aa670de6bf2ea2f2f33bfb7f2c7989bdd0fb13b2bf92b684eba039c631c6da806624e1576ce75a6148b2975a31e173859a9b908726626ddef2f8a148dd00')

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp "$srcdir"/$pkgname-$pkgver/*.jar "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/xmirose" "$pkgdir/opt/$pkgname"
  install -D -m755 "$srcdir/umleditor" "$pkgdir/usr/bin/umleditor"
}
