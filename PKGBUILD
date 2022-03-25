# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>

pkgname=alephone-phoenix
pkgver=1.4
pkgrel=2
pkgdesc="A 35-level single player major conversion"
arch=('any')
url="http://simplici7y.com/items/marathon-phoenix-2"
license=('unknown')
depends=('alephone')
source=("Marathon Phoenix 1.4.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('9976729ce062cc10015a16c80b6d4ec77e8f686eb2954620aad0fb787fb2c8f1'
            '71eb4d35aefe82c9f57e4b286cd017099574e34a25259a238aaab30d3960d794'
            '17cfb0e452e28f907202dafb306c027aed56b7e6ab7997242c56dfec573bb4f4')

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Marathon Phoenix 1.4" "$pkgdir"/usr/share/AlephOne/scenarios/phoenix
  find "$pkgdir"/usr/share/AlephOne/scenarios/phoenix -type f -exec chmod 644 {} \;
}
