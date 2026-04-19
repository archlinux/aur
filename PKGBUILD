# Maintainer: Emmy D'Anello <emmy.danello@luemy.eu>

pkgname=olvid
pkgver=2.8.0
pkgrel=0
epoch=1
pkgdesc="French instant, private and secure messenger"
arch=('x86_64')
url="https://www.olvid.io/"
license=('custom')
provides=('olvid')
source=("https://static.olvid.io/linux/olvid-${pkgver}.tar.gz")

sha256sums=("b812a08f04d52ddfe83a32bfc6f9600ca9189f6d95fe7935fafdaa57e521e93d")

package() {
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  bsdtar -xf olvid-${pkgver}.tar.gz -C "$pkgdir/opt/"
  ln -s "/opt/olvid/bin/olvid" "$pkgdir/usr/bin/olvid"
  install -Dm644 "olvid/share/olvid-olvid.desktop" "$pkgdir/usr/share/applications/olvid.desktop"
}
