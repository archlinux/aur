# Maintainer: Emmy D'Anello <emmy.danello@luemy.eu>

pkgname=olvid
pkgver=2.3.0
pkgrel=1
epoch=1
pkgdesc="French instant, private and secure messenger"
arch=('x86_64')
url="https://www.olvid.io/"
license=('custom')
provides=('olvid')
source=("https://static.olvid.io/linux/olvid-${pkgver}.tar.gz")

sha256sums=("333583a85f267ebb48466cf8128c5e7a4de7c15d12dd3a1b64dc481b3d5240cf")

package() {
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  bsdtar -xf olvid-${pkgver}.tar.gz -C "$pkgdir/opt/"
  ln -s "/opt/olvid/bin/olvid" "$pkgdir/usr/bin/olvid"
  install -Dm644 "olvid/share/olvid-olvid.desktop" "$pkgdir/usr/share/applications/olvid.desktop"
}
