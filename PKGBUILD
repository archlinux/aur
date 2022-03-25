# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=xerox-workcentre-6515-6510
pkgver=5.662.0.0
pkgrel=3
pkgdesc="Xerox WorkCentre 6515 / Phaser 6510 printer driver for CUPS"
arch=('x86_64')
url="https://www.support.xerox.com/en-us/product/workcentre-6515/content/144488?language=en&platform=win10"
license=('custom')
depends=('cups')
makedepends=('unrar')
source=('LICENSE'
        "$pkgname.exe::https://download.support.xerox.com/pub/drivers/6510/drivers/win10/ar/Phaser_6510_${pkgver}_PPD_English.exe"
)
sha256sums=('98ec516f5a59dc7b664f8c646efe3eb3f956c3b6de97779359ca1f5ffe849083'
            'f24786cf0310ba71afdb4529f25829c8b589cdc7a842e1c2ea0a9a3e101a9111')

prepare() {
    cd "$srcdir"
    unrar x "$pkgname.exe" > /dev/null
}

package() {
    cd "$srcdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 xrx6515.ppd "$pkgdir/usr/share/ppd/xerox/xrx6515.ppd"
    install -Dm644 xrx6510.ppd "$pkgdir/usr/share/ppd/xerox/xrx6510.ppd"
}
