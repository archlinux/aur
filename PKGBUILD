# Maintainer: Emmy D'Anello <emmy.danello@luemy.eu>

pkgname=olvid
pkgver=2.5.1
pkgrel=0
epoch=1
pkgdesc="French instant, private and secure messenger"
arch=('x86_64')
url="https://www.olvid.io/"
license=('custom')
provides=('olvid')
source=("https://static.olvid.io/linux/olvid-${pkgver}.tar.gz")

sha256sums=("e9012bf6607d508fab82b1b8431c41b3984e4f6e98c5c9a3c2875efa947061f5")

package() {
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  bsdtar -xf olvid-${pkgver}.tar.gz -C "$pkgdir/opt/"
  ln -s "/opt/olvid/bin/olvid" "$pkgdir/usr/bin/olvid"
  install -Dm644 "olvid/share/olvid-olvid.desktop" "$pkgdir/usr/share/applications/olvid.desktop"
}
