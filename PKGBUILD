# $Id: PKGBUILD 264789 2017-10-30 14:31:20Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=interlis-compiler
pkgver=4.7.3
pkgrel=6
pkgdesc='Compiler for INTERLIS 2'
arch=('any')
url='https://www.interlis.ch/content/index.php?language=e'
license=('LGPL')
depends=('java-runtime')
source=("https://downloads.sourceforge.net/project/umleditor/ili2c/$pkgver/ili2c-$pkgver.zip"
        'ili2c.sh')
sha256sums=('f14f31a5677cbf6d64078e35477968dcc28bf4c21f4c91052174792b6857cba7'
            '94b5d6e74d0cbfee09d73d84bad0978bc1d8de1ce8caf18f37c49d44b3da6657')
sha512sums=('e2c97198f5815430ccdb7d7ebf5145641e15b53fb2c07719dc634aff323079eb4b0cbfa106f603affd84639bd573924f0ad987a04e063d627ae1592a52422de6'
            'f47d9fcfdb0a7c3b80600a7f887f56467cd52c522f1915b70c45b9c07b9934afed89875389f1ef84a1dfcb6514fa33db565dd245db0be6cd160e44215e1afedd')

package() {
  install -d "$pkgdir/opt/ili2c" "$pkgdir/usr/bin"
  cp -r "$srcdir/ili2c-$pkgver/"* "$pkgdir/opt/ili2c/"

  install -Dm644 "$srcdir/ili2c-$pkgver/ili2c.jar" "$pkgdir/opt/ili2c/ili2c.jar"
  install -Dm755 "$srcdir/ili2c.sh" "$pkgdir/usr/bin/ili2c"

  rm -r "$srcdir/ili2c-$pkgver/doc"
}

# vim: ts=2 sw=2 et:
