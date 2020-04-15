# Maintainer: David Vilar Benet <archlinux at b0rken dot de>
# Past Maintainer: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.1316.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('any')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Unified_StorCLI.zip")
sha512sums=('049b34d44bb1140ad804f6bb6d8fb133ac9bbc4aface721051e713c7a1056acb0f894f4f4793ef9e02e48958a745d12bc5389e7e763716c780fb1c2c387e34d6')

package() {
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/Unified_storcli_all_os/Linux/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
