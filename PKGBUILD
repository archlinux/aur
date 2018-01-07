# $Id: PKGBUILD 264789 2017-10-30 14:31:20Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=interlis-compiler
pkgver=4.2.0
pkgrel=5
pkgdesc='Compiler for INTERLIS 2'
arch=('any')
url='https://www.interlis.ch/content/index.php?language=e'
license=('LGPL')
depends=('java-runtime')
source=("https://downloads.sourceforge.net/project/umleditor/ili2c/$pkgver/ili2c-$pkgver.zip"
        'ili2c.sh')
sha256sums=('538cbcf9f01deaad468a27945390b113c922b78e4b78317a872aeae1a739c5d7'
            '94b5d6e74d0cbfee09d73d84bad0978bc1d8de1ce8caf18f37c49d44b3da6657')

package() {
  install -d "$pkgdir/opt/ili2c" "$pkgdir/usr/bin"
  cp -r "$srcdir/ili2c-$pkgver/"* "$pkgdir/opt/ili2c/"

  install -Dm644 "$srcdir/ili2c-$pkgver/ili2c.jar" "$pkgdir/opt/ili2c/ili2c.jar"
  install -Dm755 "$srcdir/ili2c.sh" "$pkgdir/usr/bin/ili2c"

  rm -r "$srcdir/ili2c-$pkgver/doc"
}

# vim: ts=2 sw=2 et:
