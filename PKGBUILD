# Maintainer: Martin Doege <mdoege at compuserve dot com>
# Contributor: Kevin Klement (klement at philos dot umass dot edu)

pkgname=otf-bergamo
pkgver=1
pkgrel=4
pkgdesc="Open type serif font resembling Bembo"
arch=('any')
url="http://fontsite.com/font-library/bergamo-pro/"
license=('custom:FontSite Free Font License')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(file://BergamoProRegular.zip
        file://BergamoProItalic.zip
        file://BergamoProBold.zip
        file://BergamoProBoldItalic.zip
        EULA.txt)
sha256sums=('27719e4cf3acc070c8bef0f8b51a5b6b4f1e4a2c8c3048bfde9721d808d999c6'
            'd330370f75aa6292ef729a2a7fe6acb0434211ee9cdb5a5c716de1ecb919909c'
            '351f2b1302076ff933e31bb0fc8ae05b4bb6a115ffa56ce96c5ca48b3f894830'
            '2219b7ac1517e342cda32c5562dabca776d8a04066666bcc74f2396dfe24a0ea'
            '27580ed9720496800c49cd6323ab27bed77643ba91422ba3840087b49e878a0c')
install=$pkgname.install

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 EULA.txt "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
}
