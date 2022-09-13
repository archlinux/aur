# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname=sgdboop-bin
pkgname_=sgdboop
pkgver=1.2.6
pkgrel=1
pkgdesc="SGDBoop is a tool that automatically applies assets from SteamGridDB directly to your Steam library"
arch=('x86_64')
url="https://www.steamgriddb.com/boop"
license=('MIT')
conflicts=('sgdboop')
depends=('shared-mime-info')

source=("https://github.com/SteamGridDB/SGDBoop/releases/download/v${pkgver}/sgdboop-linux64.tar.gz"
        "x-$pkgname_.xml")
sha512sums=('11959b736d140fe1245dd944fb349c5bec0375c427118816efc05fa192b00004cd6bc827e902f6b61de2f67c77b0f9478d1893632f76daa4acd4c9665414b9f9'
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



