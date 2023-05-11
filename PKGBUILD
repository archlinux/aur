# Maintainer:
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=steinberg-asio-sdk
pkgver=2.3.3
pkgrel=4
pkgdesc="Steinberg's ASIO SDK"
url="https://www.steinberg.net/en/company/developers.html"
arch=('any')
license=('custom')

provides=(
  "$pkgname"
  'steinberg-asio'
)
conflicts=(${provides[@]})

_release="asiosdk_2.3.3_2019-06-14"
source=(
  "https://download.steinberg.net/sdk_downloads/$_release.zip"
)
sha256sums=(
  '80f5bf2703563f6047acec2edd468d0838c9f61eced9f7cdce9629b04e9710ac'
)

package() {
  cd "$srcdir/$_release"

  install -D -m644 common/asio.h "$pkgdir/usr/include/steinberg-asio/asio.h"

  install -D -m644 Steinberg*Licensing*Agreement*.pdf -t "$pkgdir/usr/share/licenses/$pkgname"
}
