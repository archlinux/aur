# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: prettyvanilla <prettyvanilla@lavabit.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: Mitchel Humpherys <mitch.special@gmail.com>

pkgname=alephone-marathon
pkgver=20150620
pkgrel=1
pkgdesc="Marathon 1 scenario data files for Aleph One"
arch=('any')
url="http://marathon.sourceforge.net"
license=('custom')
depends=('alephone')
conflicts=('alephone-highres')
replaces=('alephone-m1a1')
source=("http://downloads.sourceforge.net/marathon/Marathon-$pkgver-Data.zip"
        "$pkgname.sh"
        "LICENSE" # TODO: clarify where this file comes from
        "$pkgname.desktop")
sha256sums=('774cb40c9bde33a5d23146e82f593ac001edd0ee4d62e5b0445953a95fd44f31'
            '64deb7f505ea1ec29e10037a2dcc297abed787b0ec4790d231bff6d08a0408d0'
            '0dde70e490e4cb3e262ed7cc4f7ef6bdc49db557a14fc8674de38b2a9a426504'
            'a6074d617b51d6674381e3d1940b2c770fb87d5825f15964006c604258796288')

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/alephone/scenarios
  cp -r Marathon "$pkgdir"/usr/share/alephone/scenarios/marathon

  # sane permissions
  find "$pkgdir"/usr/share/alephone/scenarios/marathon -type f -exec chmod 644 {} \;

  # launcher script, license and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
