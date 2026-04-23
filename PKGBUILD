# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>

pkgname=alephone-phoenix
pkgver=1.4.2.3
pkgrel=1
pkgdesc="A 35-level single player major conversion"
arch=('any')
url="http://simplici7y.com/items/marathon-phoenix-2"
license=('unknown')
depends=('alephone')
source=("Marathon_Phoenix_1.4.2.3.zip" # https://www.moddb.com/mods/marathon-phoenix/downloads/marathon-phoenix-1-4-2
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('2e14da0965332796079d4c42f5dad338ebb2431f814b45dd2a62e14cc9403141'
            '71eb4d35aefe82c9f57e4b286cd017099574e34a25259a238aaab30d3960d794'
            '17cfb0e452e28f907202dafb306c027aed56b7e6ab7997242c56dfec573bb4f4')

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Marathon Phoenix 1.4.2" "$pkgdir"/usr/share/AlephOne/scenarios/phoenix
  find "$pkgdir"/usr/share/AlephOne/scenarios/phoenix -type f -exec chmod 644 {} \;
}
