# Maintainer: glatavento <glatavento at outlook dot com>

pkgname=ride-bin
pkgver=4.4.3732
pkgrel=1
pkgdesc='A remote IDE for Dyalog APL'
arch=('x86_64')
url="https://github.com/Dyalog/ride"
license=('MIT')
depends=('nodejs' 'dyalog-bin')
makedepends=('gendesk')
source=("https://github.com/Dyalog/ride/releases/download/v$pkgver/ride-$pkgver-1_amd64.deb")
sha256sums=('90faacfd7aa4f1c7a442e3086e02163a7512fb4b70a538ed152a64b8ff589e8a')

_name="Ride 4.4"
_exec="/opt/ride-4.4/Ride-4.4"
_categories="Development;TextEditor"

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

  gendesk -f -n --icon "ride44"
  install -Dm644 "ride.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
