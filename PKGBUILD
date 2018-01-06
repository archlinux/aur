# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=umleditor
pkgver=3.6.0
pkgrel=1
pkgdesc="UML/INTERLIS-Editor"
arch=('any')
url="http://www.umleditor.org/"
license=('LGPL')
depends=('java-runtime' 'interlis-compiler')
makedepends=('unzip')
source=(http://www.umleditor.org/download/$pkgname-$pkgver.zip 'umleditor')
md5sums=('8c14ec06dccdc2ffae64cf9904fccae6'
         'c3a61e0c0b11efefc2d1b70c2e3f1aa9')

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp "$srcdir"/$pkgname-$pkgver/*.jar "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/xmirose" "$pkgdir/opt/$pkgname"
  install -D -m755 "$srcdir/umleditor" "$pkgdir/usr/bin/umleditor"
}
