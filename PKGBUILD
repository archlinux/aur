# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname=sgdboop-bin
pkgname_=sgdboop
pkgver=1.1.0
pkgrel=2
pkgdesc="SGDBoop is a tool that automatically applies assets from SteamGridDB directly to your Steam library"
arch=('x86_64')
url="https://www.steamgriddb.com/boop"
license=('MIT')
conflicts=('sgdboop')
depends=('shared-mime-info')

source=("https://github.com/SteamGridDB/SGDBoop/releases/download/v${pkgver}/sgdboop-linux64.tar.gz"
        "x-$pkgname_.xml")
sha512sums=('8ecc651690ca2a6c46e43114243e1434190ca6d251dacfc4b1a199e15c140ba535994f71da69bef4584aaa48506c5ce69f8c2473a7321b31cacde27c33da0f38'
            '35f57bab67171e96fbe2b2a11b7a4c95f06083f95af683286eb2014f61c0ad8bbc3ce913a7adc0cfa15337725bdf414e5360ca6a813e72c1b1622171b0c0a62d')

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "$srcdir/SGDBoop" "$pkgdir/usr/bin/SGDBoop"
    
    install -Dm644 "$srcdir/com.steamgriddb.SGDBoop.desktop" -t "$pkgdir/usr/share/applications"
    
    mkdir -p "$pkgdir/usr/share/mime/packages"
    install -m644 "x-$pkgname_.xml" "$pkgdir/usr/share/mime/packages/x-$pkgname_.xml"
    
    install -dm755 "${pkgdir}/usr/lib"
    install -Dm644 "$srcdir/libiup.so" "$pkgdir/usr/lib/libiup.so"
    
    echo "Go to the following website and press the blue button (Step 2) to enable the boop function:"
    echo "https://www.steamgriddb.com/boop"
}



