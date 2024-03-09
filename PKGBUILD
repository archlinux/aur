# Maintainer: glatavento <glatavento at outlook dot com>

pkgname=ride-bin
pkgver=4.5.4097
pkgrel=1
pkgdesc='A remote IDE for Dyalog APL'
arch=('x86_64')
url="https://github.com/Dyalog/ride"
license=('MIT')
depends=('nodejs' 'dyalog-bin')
makedepends=('gendesk')
source=("https://github.com/Dyalog/ride/releases/download/v$pkgver/ride-$pkgver-1_amd64.deb")
sha256sums=('4ae402b63e9a776e8e7e90a21b5da7874823a5bebdf3e7c00c0b532285404543')

_name="Ride 4.5"
_exec="/opt/ride-4.5/Ride-4.5"
_categories="Development;TextEditor"

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

  gendesk -f -n --icon "ride45"
  install -Dm644 "ride.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
