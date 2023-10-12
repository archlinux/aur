# Maintainer: glatavento <glatavento at outlook dot com>

pkgname=ride-beta-bin
pkgver=4.5.4043
pkgrel=1
pkgdesc='A remote IDE for Dyalog APL'
arch=('x86_64')
url="https://github.com/Dyalog/ride"
license=('MIT')
depends=('nodejs' 'dyalog-bin')
makedepends=('gendesk')
source=("https://github.com/Dyalog/ride/releases/download/v$pkgver/ride-$pkgver-1_amd64.deb")
sha256sums=('dae16b2c43811b1d111dc02beff11a9e2de0fa04a82e50ff2a244bb192292847')

_name="Ride 4.5"
_exec="/opt/ride-4.5/Ride-4.5"
_categories="Development;TextEditor"

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

  gendesk -f -n --icon "ride45"
  install -Dm644 "ride-beta.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
