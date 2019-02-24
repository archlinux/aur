# Maintainer: David Barri <japgolly@gmail.com>

pkgname=tla-tools
pkgver=1.5.7
pkgrel=1
pkgdesc="Tools for the TLA+2 language (SANY, TLC, PlusCal translator and TLATeX)"
arch=('any')
url="http://research.microsoft.com/en-us/um/people/lamport/tla/tools.html"
license=('MIT')
depends=('java-runtime')
options=(!strip)
source=(
  "https://github.com/tlaplus/tlaplus/releases/download/v$pkgver/tla2tools.jar"
  'pcal'
  'tla2sany'
  'tla2tex'
  'tlc'
)
noextract=('tla2tools.jar')
sha256sums=('1626add371f8e198ea23f86d16d0c72166978456baaa61f1afec901283b92595'
            '81989cdc3072b9ea3c3120cee7d3f8578fc1dc4933ac2a60cd1982227a9d24cc'
            'c4c083ebedb2ef69a34bfbc4da4bf9b2a2df7b2d5c5053f71e2a9eeec7147b2f'
            '574eb88e87d6c115b8269e350903ded2cebb9c721353c20b92206cc76934fbc6'
            '400c89b5ebc69ea0bc7440415d057ec6d734fd4b884b514beecf61686bf702ed')

package() {
  mkdir -p "$pkgdir/usr/share/java" "$pkgdir/usr/bin"
  cp -a tla2tools.jar "$pkgdir/usr/share/java"
  cp -a {pcal,tla2sany,tla2tex,tlc} "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
