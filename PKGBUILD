# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=tastyworks
pkgver=0.27.0
pkgrel=1
pkgdesc="One of the fastest, most reliable, and most secure trading platforms in the world."
arch=('x86_64')
url="https://tastyworks.com/technology.html"
license=('Other')
depends=('java-runtime')
source=("https://download.tastyworks.com/desktop/$pkgver/$pkgname-$pkgver.rpm"
        "https://claytrader.com/wp-content/themes/ClayTrader/images/resources/tastyworks.png")
sha256sums=('1e512ea67dc99f0a1108764c960a47e1f4e97ff51c7a62a386843611c22d1965'
            '0b566ce89d2030d2fe5e1aa2133c868e23da0c0accc3708b1960e2db7ebe7bcb')

package() {

    cd "$srcdir"

    install -d      "$pkgdir/opt/$pkgname"
    cp      -r      "$srcdir/opt/$pkgname/"                             "$pkgdir/opt/"

    sed     -i      's|Name=tastyworks|Name=TastyWorks|'                "$srcdir/opt/$pkgname/$pkgname.desktop"
    sed     -i      's|Comment=tastyworks|Comment=Trading Platform|'    "$srcdir/opt/$pkgname/$pkgname.desktop"
    sed     -i      's|Categories=Unknown|Categories=Internet|'         "$srcdir/opt/$pkgname/$pkgname.desktop"

    install -Dm 644 "$srcdir/opt/$pkgname/$pkgname.desktop"             "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm 644 "$pkgname.png"                                      "$pkgdir/opt/$pkgname/$pkgname.png"
}