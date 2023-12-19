# Maintainer: Anti Räis <antirais at gmail dot com>

pkgname=cdoc4j-util
pkgver=1.4
pkgrel=1
pkgdesc='Command line utility for working with CDOC documents.'
arch=('any')
url='https://github.com/open-eid/cdoc4j/blob/master/util/README.md'
license=('GPL2')
depends=('java-runtime>=8')
makedepends=('git')
source=(
    "https://github.com/open-eid/cdoc4j/releases/download/$pkgver/$pkgname-$pkgver.zip"
    'cdoc4j-util.sh'
)
sha256sums=(
    '717eef2c6d4369e73746f2e0c7c6b68a78b36fe1bf05068581853bc52c203c02'
    '7907decd0ee647ce8be80bc1af975f726edbe4390b1694539ddbd25d1b0bf526'
)

package() {
    cd $srcdir

    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm755 "bcprov-jdk15on.jar" "$pkgdir/usr/share/java/$pkgname/"
}
