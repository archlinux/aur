# Maintainer: David Vilar Benet <archlinux at b0rken dot de>
# Past Maintainer: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.1410.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('any')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Unified_StorCLI.zip")
sha512sums=('4887d434757f15e931c3c3c57b2316fc0cf0a5284c6009601b58c9585b73f9b9c9a0318dd3c4472cd3578aa5ec12b641a371db1d726a637741f6f0b34dd1f3e7')

package() {
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/Unified_storcli_all_os/Linux/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
