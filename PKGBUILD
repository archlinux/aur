# Maintainer: Emmy D'Anello <emmy.danello@luemy.eu>

pkgname=olvid
pkgver=3.0.0
pkgrel=0
epoch=1
pkgdesc="French instant, private and secure messenger"
arch=('x86_64')
url="https://www.olvid.io/"
license=('custom')
provides=('olvid')
source=("https://static.olvid.io/linux/olvid-${pkgver}.tar.gz")

sha256sums=("5b8ed91da8002d11c0330d063048e22bb59d2583b60e26482c15489a719b4e2e")

package() {
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  bsdtar -xf olvid-${pkgver}.tar.gz -C "$pkgdir/opt/"
  ln -s "/opt/olvid/bin/olvid" "$pkgdir/usr/bin/olvid"
  install -Dm644 "olvid/share/olvid-olvid.desktop" "$pkgdir/usr/share/applications/olvid.desktop"
}
