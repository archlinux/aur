# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname="xerox-workcentre-6515-6510"
pkgver=5.662.0.0
pkgrel=1
pkgdesc="Xerox WorkCentre 6515 / Phaser 6510 printer driver for CUPS"
arch=('x86_64')
url="https://www.support.xerox.com/support/workcentre-6515/file-download/enus.html?operatingSystem=win10&fileLanguage=en&contentId=144488&from=downloads&viewArchived=false"
license=('custom')
depends=('cups')
makedepends=('unrar')
source=("$pkgname.exe::http://download.support.xerox.com/pub/drivers/6510/drivers/win10/ar/Phaser_6510_${pkgver}_PPD_English.exe"
            "LICENSE")
sha256sums=("29b83d7276b167fdb0cbbd1e110b424658ca1e93b781cab674d6a93a2df5f7a9"
            "98ec516f5a59dc7b664f8c646efe3eb3f956c3b6de97779359ca1f5ffe849083")

prepare() {
    unrar x "$pkgname.exe"
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 xrx6515.ppd "$pkgdir/usr/share/ppd/xerox/xrx6515.ppd"
    install -Dm644 xrx6510.ppd "$pkgdir/usr/share/ppd/xerox/xrx6510.ppd"
}
