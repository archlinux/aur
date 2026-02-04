# Maintainer:
# Contributor: Tony Lambiris <tony@libpcap.net>

_pkgname="steinberg-asio"
pkgname="$_pkgname-sdk"
pkgver=2.3.4
pkgrel=1
pkgdesc="Steinberg's ASIO SDK"
url="https://www.steinberg.net/en/company/developers.html"
arch=('any')
license=(
  'GPL-3.0-only' # dual license
  'LicenseRef-Steinberg'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="ASIOSDK"
_release="ASIO-SDK_2.3.4_2025-10-15"
source=("https://download.steinberg.net/sdk_downloads/$_release.zip")
sha256sums=('d5ebf0c20dd2c5f43771fd0c1418f4b361bf52434ee670097cfa6b3a335e2eca')

package() {
  cd "$_pkgsrc"
  install -Dm644 common/*.h -t"$pkgdir/usr/include/steinberg-asio/"
  install -Dm644 common/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
