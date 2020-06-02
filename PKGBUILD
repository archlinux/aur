# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>

pkgname=alephone-phoenix
pkgver=1.3
pkgrel=1
pkgdesc="A 35-level single player major conversion"
arch=('any')
url="http://simplici7y.com/items/marathon-phoenix-2"
license=('unknown')
depends=('alephone')
source=("http://simplici7y.com/items/marathon-phoenix-2/download"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('12270b379e1d8b5f2c6ab2b2266d8668424922cbda4669474bf4d4893e9806e4'
            '71eb4d35aefe82c9f57e4b286cd017099574e34a25259a238aaab30d3960d794'
            'af42176f0de2b0a4e6da62316d30494168e785b00f22fb362f2685bfe2770cb9')

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Marathon Phoenix" "$pkgdir"/usr/share/AlephOne/scenarios/phoenix
  find "$pkgdir"/usr/share/AlephOne/scenarios/phoenix -type f -exec chmod 644 {} \;
}
