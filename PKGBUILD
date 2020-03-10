# Maintainer: David Vilar Benet <archlinux at b0rken dot de>
# Past Maintainer: brent s. <bts[at]square-r00t[dot]net>

pkgname=storcli
pkgver=007.1211.0000.0000
pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards"
url="https://www.broadcom.com/"
license=('custom')
arch=('any')
source=("$pkgname-$pkgver.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/007.1211.0000.0000_Unified_StorCLI.zip")
sha512sums=('f28ae41adf2286153ecd57f7d022940069356c9636e45aaae4ae45215487bbb8e3dea51fa4aa00b9e9340069036c1be21b186ce177e0fd0a6a0bb786cb58181f')

package() {
  bsdtar -poxf "$srcdir/Unified_storcli_all_os/Linux/$pkgname-$pkgver-1.noarch.rpm" -C "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli64 "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MegaRAID/storcli/storcli "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/Unified_storcli_all_os/Linux/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
