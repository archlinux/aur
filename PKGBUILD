# $Id: PKGBUILD 264789 2017-10-30 14:31:20Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=interlis-compiler
pkgver=5.1.1
pkgrel=7
pkgdesc='Compiler for INTERLIS 2'
arch=('any')
url='https://www.interlis.ch'
license=('LGPL')
depends=('java-runtime')
source=("https://downloads.interlis.ch/ili2c/ili2c-$pkgver.zip"
        'ili2c.sh')

sha256sums=('4da1650d245f03d144c9c48e7118c1096200ba126d57d7f8deb7c7969b69ac05'
            '94b5d6e74d0cbfee09d73d84bad0978bc1d8de1ce8caf18f37c49d44b3da6657')
sha512sums=('8a18715ad1157967fd16c4b6b35b76512759ed427cee5753d23ff5aea189344ff9f10a4d054cbf4dcd36ab1b0205ff8afdb603630b02f739eaf5b855be7e1286'
            'f47d9fcfdb0a7c3b80600a7f887f56467cd52c522f1915b70c45b9c07b9934afed89875389f1ef84a1dfcb6514fa33db565dd245db0be6cd160e44215e1afedd')

package() {
  install -d "$pkgdir/opt/ili2c" "$pkgdir/usr/bin"
  cp -r "$srcdir/ili2c-$pkgver/"* "$pkgdir/opt/ili2c/"

  install -Dm644 "$srcdir/ili2c-$pkgver/ili2c.jar" "$pkgdir/opt/ili2c/ili2c.jar"
  install -Dm755 "$srcdir/ili2c.sh" "$pkgdir/usr/bin/ili2c"

  rm -r "$srcdir/ili2c-$pkgver/doc"
}

# vim: ts=2 sw=2 et:
