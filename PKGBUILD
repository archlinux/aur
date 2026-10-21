# Maintainer: Emmy D'Anello <emmy.danello@luemy.eu>

pkgname=olvid
pkgver=3.3.0
pkgrel=0
epoch=1
pkgdesc="French instant, private and secure messenger"
arch=('x86_64')
url="https://www.olvid.io/"
license=('custom')
provides=('olvid')
source=("https://static.olvid.io/linux/olvid-${pkgver}.tar.gz")

sha256sums=("c97cd2283e2d7ad40d54a06131fc40ccf7a74c946b24a79202881243be472c8e")

package() {
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  bsdtar -xf olvid-${pkgver}.tar.gz -C "$pkgdir/opt/"
  ln -s "/opt/olvid/bin/olvid" "$pkgdir/usr/bin/olvid"
  install -Dm644 "olvid/share/olvid-olvid.desktop" "$pkgdir/usr/share/applications/olvid.desktop"
}
