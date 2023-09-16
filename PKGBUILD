# Maintainer: Tomoghno Sen <tomoghno@outlook.com>
 
pkgname=sgdboop-bin
_pkgname=sgdboop
pkgver=1.2.8
pkgrel=1
pkgdesc="SGDBoop is a tool that automatically applies assets from SteamGridDB directly to your Steam library"
arch=('x86_64')
url="https://www.steamgriddb.com/boop"
license=('MIT')
conflicts=('sgdboop')
depends=('shared-mime-info')
 
source=("https://github.com/SteamGridDB/SGDBoop/releases/download/v${pkgver}/sgdboop-linux64.tar.gz"
        "x-$_pkgname.xml")
sha512sums=('42f76f5cf3fad008e0581ef8779a2fe644feda28753952f8911e2b021f24589ec37a4279836511ee1e5810259d57926a5f60070855fe8786853f1dd0251c5804'
            '35f57bab67171e96fbe2b2a11b7a4c95f06083f95af683286eb2014f61c0ad8bbc3ce913a7adc0cfa15337725bdf414e5360ca6a813e72c1b1622171b0c0a62d')
 
package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "$srcdir/SGDBoop" "$pkgdir/usr/bin/SGDBoop"
    
    install -Dm644 "$srcdir/com.steamgriddb.SGDBoop.desktop" -t "$pkgdir/usr/share/applications"
    
    mkdir -p "$pkgdir/usr/share/mime/packages"
    install -m644 "x-$_pkgname.xml" "$pkgdir/usr/share/mime/packages/x-$_pkgname.xml"
    
    install -dm755 "${pkgdir}/usr/lib"
    install -Dm644 "$srcdir/libiup.so" "$pkgdir/usr/lib/libiup.so"
    
    echo "Go to the following website and press the blue button (Step 2) to enable the boop function:"
    echo "https://www.steamgriddb.com/boop"
}
