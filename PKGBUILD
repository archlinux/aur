# Maintainer: Kevin Klement (klement at philos dot umass dot edu)
pkgname=otf-bergamo
pkgver=1
pkgrel=4
pkgdesc="Open type serif font resembling Bembo"
arch=('any')
url="http://www.fontsite.com/download-free-fonts/bergamo-std"
license=('custom:FontSite Free Font License')
depends=('fontconfig' 'xorg-font-utils')
source=(file://BergamoProRegular.zip
        file://BergamoProItalic.zip
        file://BergamoProBold.zip
        file://BergamoProBoldItalic.zip)
sha256sums=('27719e4cf3acc070c8bef0f8b51a5b6b4f1e4a2c8c3048bfde9721d808d999c6'
            'd330370f75aa6292ef729a2a7fe6acb0434211ee9cdb5a5c716de1ecb919909c'
            '351f2b1302076ff933e31bb0fc8ae05b4bb6a115ffa56ce96c5ca48b3f894830'
            '2219b7ac1517e342cda32c5562dabca776d8a04066666bcc74f2396dfe24a0ea')
install=$pkgname.install

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 EULA.txt "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
}

