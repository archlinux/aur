# Maintainer: Seunghun Kim <seunghunkim at icloud dot com>

# The name 'hop' is already taken on the AUR by an unrelated project,
# so this package uses the 'openhwp' suffix from HOP's tagline
# ("HOP is Open HWP") for disambiguation.

pkgname=hop-openhwp-bin
_pkgname=hop-openhwp
pkgver=0.1.10
pkgrel=1
pkgdesc="Open desktop editor for HWP and HWPX documents"
arch=('x86_64')
url="https://github.com/golbin/hop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')

source=(
  "$pkgname-$pkgver.deb::${url}/releases/download/v${pkgver}/HOP-linux-x64.deb"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
noextract=("$pkgname-$pkgver.deb")
sha256sums=('2563efd611a1174e02797ff203f53c4febc7d64107a602238933ae48a52e9891'
            '1c3a7d5643b163a3ead4965e1bea33b832caee5bfca265efe42afcd7bc696b5b')

package() {
  cd "$srcdir"
  bsdtar -xf "$pkgname-$pkgver.deb"
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
