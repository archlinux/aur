# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: prettyvanilla <prettyvanilla@lavabit.com>
# Contributor: rabyte <rabyte__gmail>
# Contributor: Marcin Skory <armitage at q84fh dot net>

pkgname=alephone-infinity
pkgver=20140104
pkgrel=1
pkgdesc="Marathon Infinity scenario data files for Aleph One"
arch=('any')
url="http://marathon.sourceforge.net"
license=('custom')
depends=('alephone')
conflicts=('alephone-highres')
source=(MarathonInfinity-$pkgver-Data.zip::"http://marathon.sourceforge.net/download/data.php?game=infinity"
        "$pkgname.sh"
        "LICENSE" # TODO: clarify where this file comes from
        "$pkgname.desktop")
sha256sums=('137329e9efdd3c219b48a56322ec5651c606c3e8078dfeaa7c9c14470cf5aa29'
            '593fbb16d2f72de59c7507219f84284fde65ad5f878c468f0ef604b8217b4d85'
            '0dde70e490e4cb3e262ed7cc4f7ef6bdc49db557a14fc8674de38b2a9a426504'
            '18f4458fe6b04e135947ede5ec7578858ea6c99032e434b10b05a281670c79c6')

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/alephone/scenarios
  cp -r "Marathon Infinity" "$pkgdir"/usr/share/alephone/scenarios/infinity
  # sane permissions
  find "$pkgdir"/usr/share/alephone/scenarios/infinity -type f -exec chmod 644 {} \;

  # launcher script, license and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
